// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ReerJSON
import ZippyJSON
import IkigaJSON

let githubEventsJSONData: Data = {
    let url = Bundle.module.url(forResource: "github_events", withExtension: "json")!
    return try! Data(contentsOf: url)
}()

let twitterJSONData: Data = {
    let url = Bundle.module.url(forResource: "twitter", withExtension: "json")!
    return try! Data(contentsOf: url)
}()

// MARK: - Benchmark Implementation

import Darwin

struct BenchmarkResult {
    let name: String
    let decodesPerSecond: Double
    let averageTime: Double
    let iterations: Int
}

// Helper function to measure execution time
func measureTime<T>(_ closure: () throws -> T) rethrows -> (result: T, time: Double) {
    let startTime = CFAbsoluteTimeGetCurrent()
    let result = try closure()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    return (result, timeElapsed)
}

// Benchmark function
func benchmark<T: Decodable>(
    name: String,
    decoder: Any,
    jsonData: Data,
    type: T.Type,
    iterations: Int = 10
) -> BenchmarkResult {
    var totalTime: Double = 0
    var successCount = 0
    
    print("Testing \(name)...")
    
    for i in 1...iterations {
        do {
            let (_, time) = try measureTime {
                if let foundationDecoder = decoder as? JSONDecoder {
                    return try foundationDecoder.decode(type, from: jsonData)
                } else if let reerDecoder = decoder as? ReerJSONDecoder {
                    return try reerDecoder.decode(type, from: jsonData)
                } else if let zippyDecoder = decoder as? ZippyJSON.ZippyJSONDecoder {
                    return try zippyDecoder.decode(type, from: jsonData)
                } else if let ikigaDecoder = decoder as? IkigaJSON.IkigaJSONDecoder {
                    return try ikigaDecoder.decode(type, from: jsonData)
                } else {
                    throw NSError(domain: "BenchmarkError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unknown decoder type"])
                }
            }
            totalTime += time
            successCount += 1
            
            // Display progress
//            if i % 2 == 0 || i == iterations {
//                print("  Completed \(i)/\(iterations) tests")
//            }
        } catch {
            print("  Test \(i) failed: \(error)")
        }
    }
    
    guard successCount > 0 else {
        return BenchmarkResult(name: name, decodesPerSecond: 0, averageTime: 0, iterations: 0)
    }
    
    let averageTime = totalTime / Double(successCount)
    let decodesPerSecond = 1.0 / averageTime
    
    return BenchmarkResult(
        name: name,
        decodesPerSecond: decodesPerSecond,
        averageTime: averageTime,
        iterations: successCount
    )
}

// Generic benchmark runner for any JSON data and type
func runBenchmark<T: Decodable>(datasetName: String, jsonData: Data, type: T.Type, iterations: Int = 100) -> [BenchmarkResult] {
    print("🚀 Starting \(datasetName) JSON Decoding Benchmark")
    print("Data size: \(jsonData.count) bytes")
    print(String(repeating: "=", count: 60))
    
    var results: [BenchmarkResult] = []
    
    // 1. Foundation JSONDecoder
    let foundationDecoder = Foundation.JSONDecoder()
    foundationDecoder.dateDecodingStrategy = .iso8601
    let foundationResult = benchmark(
        name: "Foundation JSONDecoder",
        decoder: foundationDecoder,
        jsonData: jsonData,
        type: type,
        iterations: iterations
    )
    results.append(foundationResult)
    
    print()
    
    // 2. ReerJSON
    let reerDecoder = ReerJSONDecoder()
    reerDecoder.dateDecodingStrategy = .iso8601
    let reerResult = benchmark(
        name: "ReerJSON",
        decoder: reerDecoder,
        jsonData: jsonData,
        type: type,
        iterations: iterations
    )
    results.append(reerResult)
    
    print()
    
    // 3. ZippyJSON
    let zippyDecoder = ZippyJSON.ZippyJSONDecoder()
    zippyDecoder.dateDecodingStrategy = .iso8601
    let zippyResult = benchmark(
        name: "ZippyJSON",
        decoder: zippyDecoder,
        jsonData: jsonData,
        type: type,
        iterations: iterations
    )
    results.append(zippyResult)
    
    print()
    
    // 4. IkigaJSON
    var ikigaDecoder = IkigaJSON.IkigaJSONDecoder()
    ikigaDecoder.settings.dateDecodingStrategy = .iso8601
    let ikigaResult = benchmark(
        name: "IkigaJSON",
        decoder: ikigaDecoder,
        jsonData: jsonData,
        type: type,
        iterations: iterations
    )
    results.append(ikigaResult)
    
    return results
}

// Print benchmark results
func printBenchmarkResults(datasetName: String, results: [BenchmarkResult], iterations: Int) {
    print()
    print(String(repeating: "=", count: 60))
    print("📊 \(datasetName) Benchmark Results Summary")
    print(String(repeating: "=", count: 60))
    
    // Sort by performance
    let sortedResults = results.sorted { $0.decodesPerSecond > $1.decodesPerSecond }
    
    // Find Foundation JSONDecoder as baseline (always use Foundation as 1.00x)
    guard let foundationResult = results.first(where: { $0.name == "Foundation JSONDecoder" }) else {
        print("Error: Foundation JSONDecoder result not found")
        return
    }
    
    // Use safer string formatting methods
    let nameWidth = 25
    let numberWidth = 20
    
    // Use string interpolation to print headers, avoiding format issues
    let headerName = "Decoder".padding(toLength: nameWidth, withPad: " ", startingAt: 0)
    let headerDecodes = "Decodes Per Second".padding(toLength: numberWidth, withPad: " ", startingAt: 0)
    let headerTime = "Average Time (ms)".padding(toLength: numberWidth, withPad: " ", startingAt: 0)
    let headerSpeed = "Relative Speed".padding(toLength: numberWidth, withPad: " ", startingAt: 0)
    
    print("\(headerName) \(headerDecodes) \(headerTime) \(headerSpeed)")
    print(String(repeating: "-", count: 80))
    
    for result in sortedResults {
        let relativeSpeed = result.decodesPerSecond / foundationResult.decodesPerSecond
        
        // Check if values are valid
        let decodesPerSecondStr = result.decodesPerSecond.isFinite ? String(format: "%.2f ops", result.decodesPerSecond) : "N/A"
        let averageTimeStr = result.averageTime.isFinite ? String(format: "%.3f ms", result.averageTime * 1000) : "N/A"
        let relativeSpeedStr = relativeSpeed.isFinite ? String(format: "%.2fx", relativeSpeed) : "N/A"
        
        // Use string interpolation instead of complex formatting
        let paddedName = result.name.padding(toLength: nameWidth, withPad: " ", startingAt: 0)
        let paddedDecodes = decodesPerSecondStr.padding(toLength: numberWidth, withPad: " ", startingAt: 0)
        let paddedTime = averageTimeStr.padding(toLength: numberWidth, withPad: " ", startingAt: 0)
        let paddedSpeed = relativeSpeedStr.padding(toLength: numberWidth, withPad: " ", startingAt: 0)
        
        print("\(paddedName) \(paddedDecodes) \(paddedTime) \(paddedSpeed)")
    }
    
    print()
    print("🏆 Fastest: \(sortedResults.first!.name)")
    print("📊 Baseline: Foundation JSONDecoder (1.00x)")
    print("📈 Average results based on \(iterations) tests")
}

// Run all benchmarks for both datasets
func runAllBenchmarks() {
    let iterations = 5000 // Number of test iterations
    
    // 1. GitHub Events Dataset
    let githubResults = runBenchmark(
        datasetName: "GitHub Events",
        jsonData: githubEventsJSONData,
        type: [Event].self,
        iterations: iterations
    )
    printBenchmarkResults(datasetName: "GitHub Events", results: githubResults, iterations: iterations)
    
    print("\n")
    print(String(repeating: "🌟", count: 30))
    print("\n")
    
    // 2. Twitter Dataset
    let twitterResults = runBenchmark(
        datasetName: "Twitter",
        jsonData: twitterJSONData,
        type: Twitter.self,
        iterations: iterations
    )
    printBenchmarkResults(datasetName: "Twitter", results: twitterResults, iterations: iterations)
    
    // Overall comparison
    print("\n")
    print(String(repeating: "=", count: 80))
    print("🔥 Overall Performance Comparison")
    print(String(repeating: "=", count: 80))
    
    // Compare fastest performers from each dataset
    let githubFastest = githubResults.sorted { $0.decodesPerSecond > $1.decodesPerSecond }.first!
    let twitterFastest = twitterResults.sorted { $0.decodesPerSecond > $1.decodesPerSecond }.first!
    
    print("GitHub Events Dataset:")
    print("  🏆 Fastest: \(githubFastest.name)")
    print("  📊 Performance: \(String(format: "%.2f", githubFastest.decodesPerSecond)) ops/sec")
    print("  📏 Data size: \(githubEventsJSONData.count) bytes")
    
    print("\nTwitter Dataset:")
    print("  🏆 Fastest: \(twitterFastest.name)")
    print("  📊 Performance: \(String(format: "%.2f", twitterFastest.decodesPerSecond)) ops/sec")
    print("  📏 Data size: \(twitterJSONData.count) bytes")
    
    // Data complexity comparison
    let githubComplexity = Double(githubEventsJSONData.count) / githubFastest.decodesPerSecond
    let twitterComplexity = Double(twitterJSONData.count) / twitterFastest.decodesPerSecond
    
    print("\n数据复杂度分析:")
    print("  GitHub Events: \(String(format: "%.0f", githubComplexity)) bytes per operation")
    print("  Twitter: \(String(format: "%.0f", twitterComplexity)) bytes per operation")
    
    if githubComplexity > twitterComplexity {
        print("  📈 GitHub Events 数据结构相对更复杂")
    } else {
        print("  📈 Twitter 数据结构相对更复杂")
    }
}

// MARK: - Main

runAllBenchmarks()
