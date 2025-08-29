// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ReerJSON
import ZippyJSON
import IkigaJSON

// MARK: - Main

public enum Benchmark {
    public static func run(iterations: Int = 100) {
        runAllBenchmarks(iterations: iterations)
    }
}

let githubEventsJSONData: Data = {
    let url = Bundle.module.url(forResource: "github_events", withExtension: "json")!
    return try! Data(contentsOf: url)
}()

let twitterJSONData: Data = {
    let url = Bundle.module.url(forResource: "twitter", withExtension: "json")!
    return try! Data(contentsOf: url)
}()

let apacheBuildsJSONData: Data = {
    let url = Bundle.module.url(forResource: "apache_builds", withExtension: "json")!
    return try! Data(contentsOf: url)
}()

let canadaJSONData: Data = {
    let url = Bundle.module.url(forResource: "canada", withExtension: "json")!
    return try! Data(contentsOf: url)
}()

let randomJSONData: Data = {
    let url = Bundle.module.url(forResource: "random", withExtension: "json")!
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

// Run all benchmarks for all five datasets
func runAllBenchmarks(iterations: Int = 100) {
    
    // Store all results for comparison
    var allDatasetResults: [(name: String, results: [BenchmarkResult], size: Int)] = []
    
    // 1. GitHub Events Dataset
    print("📁 Dataset 1/5: GitHub Events")
    let githubResults = runBenchmark(
        datasetName: "GitHub Events",
        jsonData: githubEventsJSONData,
        type: [Event].self,
        iterations: iterations
    )
    printBenchmarkResults(datasetName: "GitHub Events", results: githubResults, iterations: iterations)
    allDatasetResults.append(("GitHub Events", githubResults, githubEventsJSONData.count))
    
    print("\n" + String(repeating: "🌟", count: 30) + "\n")
    
    // 2. Twitter Dataset
    print("📁 Dataset 2/5: Twitter")
    let twitterResults = runBenchmark(
        datasetName: "Twitter",
        jsonData: twitterJSONData,
        type: Twitter.self,
        iterations: iterations
    )
    printBenchmarkResults(datasetName: "Twitter", results: twitterResults, iterations: iterations)
    allDatasetResults.append(("Twitter", twitterResults, twitterJSONData.count))
    
    print("\n" + String(repeating: "🌟", count: 30) + "\n")
    
    // 3. Apache Builds Dataset
    print("📁 Dataset 3/5: Apache Builds")
    let apacheResults = runBenchmark(
        datasetName: "Apache Builds",
        jsonData: apacheBuildsJSONData,
        type: ApacheBuilds.self,
        iterations: iterations
    )
    printBenchmarkResults(datasetName: "Apache Builds", results: apacheResults, iterations: iterations)
    allDatasetResults.append(("Apache Builds", apacheResults, apacheBuildsJSONData.count))
    
    print("\n" + String(repeating: "🌟", count: 30) + "\n")
    
    // 4. Canada Dataset
    print("📁 Dataset 4/5: Canada Geography")
    let canadaResults = runBenchmark(
        datasetName: "Canada Geography",
        jsonData: canadaJSONData,
        type: canada.self,
        iterations: iterations
    )
    printBenchmarkResults(datasetName: "Canada Geography", results: canadaResults, iterations: iterations)
    allDatasetResults.append(("Canada Geography", canadaResults, canadaJSONData.count))
    
    print("\n" + String(repeating: "🌟", count: 30) + "\n")
    
    // 5. Random Data Dataset
    print("📁 Dataset 5/5: Random Data")
    let randomResults = runBenchmark(
        datasetName: "Random Data",
        jsonData: randomJSONData,
        type: random.self,
        iterations: iterations
    )
    printBenchmarkResults(datasetName: "Random Data", results: randomResults, iterations: iterations)
    allDatasetResults.append(("Random Data", randomResults, randomJSONData.count))
    
    // Overall comparison across all datasets
    print("\n")
    print(String(repeating: "=", count: 90))
    print("🔥 Overall Performance Comparison - All 5 Datasets")
    print(String(repeating: "=", count: 90))
    
    // Create summary table
    print("\n📊 Performance Summary by Dataset:")
    print(String(repeating: "-", count: 90))
    
    let headerDataset = "Dataset".padding(toLength: 20, withPad: " ", startingAt: 0)
    let headerFastest = "Fastest Decoder".padding(toLength: 25, withPad: " ", startingAt: 0)
    let headerPerf = "Performance".padding(toLength: 15, withPad: " ", startingAt: 0)
    let headerSize = "Size (bytes)".padding(toLength: 12, withPad: " ", startingAt: 0)
    let headerComplexity = "Bytes/Op".padding(toLength: 10, withPad: " ", startingAt: 0)
    
    print("\(headerDataset) \(headerFastest) \(headerPerf) \(headerSize) \(headerComplexity)")
    print(String(repeating: "-", count: 90))
    
    for (datasetName, results, size) in allDatasetResults {
        let fastest = results.sorted { $0.decodesPerSecond > $1.decodesPerSecond }.first!
        let complexity = Double(size) / fastest.decodesPerSecond
        
        let paddedDataset = datasetName.padding(toLength: 20, withPad: " ", startingAt: 0)
        let paddedDecoder = fastest.name.padding(toLength: 25, withPad: " ", startingAt: 0)
        let paddedPerf = String(format: "%.1f ops/s", fastest.decodesPerSecond).padding(toLength: 15, withPad: " ", startingAt: 0)
        let paddedSize = String(size).padding(toLength: 12, withPad: " ", startingAt: 0)
        let paddedComplexity = String(format: "%.0f", complexity).padding(toLength: 10, withPad: " ", startingAt: 0)
        
        print("\(paddedDataset) \(paddedDecoder) \(paddedPerf) \(paddedSize) \(paddedComplexity)")
    }
    
    // Decoder comparison across datasets
    print("\n🏆 Decoder Performance Ranking:")
    print(String(repeating: "-", count: 60))
    
    // Calculate average relative performance for each decoder
    let decoderNames = ["Foundation JSONDecoder", "ReerJSON", "ZippyJSON", "IkigaJSON"]
    var decoderAverages: [(String, Double)] = []
    
    for decoderName in decoderNames {
        var totalRelativePerformance = 0.0
        var validDatasets = 0
        
        for (_, results, _) in allDatasetResults {
            if let foundationResult = results.first(where: { $0.name == "Foundation JSONDecoder" }),
               let decoderResult = results.first(where: { $0.name == decoderName }),
               foundationResult.decodesPerSecond > 0 {
                totalRelativePerformance += decoderResult.decodesPerSecond / foundationResult.decodesPerSecond
                validDatasets += 1
            }
        }
        
        if validDatasets > 0 {
            decoderAverages.append((decoderName, totalRelativePerformance / Double(validDatasets)))
        }
    }
    
    decoderAverages.sort { $0.1 > $1.1 }
    
    for (index, (decoderName, avgPerformance)) in decoderAverages.enumerated() {
        let rank = index + 1
        let medal = rank == 1 ? "🥇" : rank == 2 ? "🥈" : rank == 3 ? "🥉" : "  "
        print("\(medal) #\(rank) \(decoderName): \(String(format: "%.2fx", avgPerformance)) average relative performance")
    }
    
    // Data complexity insights
    print("\n📈 Data Complexity Analysis:")
    let sortedByComplexity = allDatasetResults.sorted { 
        let complexity1 = Double($0.size) / $0.results.sorted { $0.decodesPerSecond > $1.decodesPerSecond }.first!.decodesPerSecond
        let complexity2 = Double($1.size) / $1.results.sorted { $0.decodesPerSecond > $1.decodesPerSecond }.first!.decodesPerSecond
        return complexity1 > complexity2
    }
    
    print("从最复杂到最简单:")
    for (index, (datasetName, results, size)) in sortedByComplexity.enumerated() {
        let fastest = results.sorted { $0.decodesPerSecond > $1.decodesPerSecond }.first!
        let complexity = Double(size) / fastest.decodesPerSecond
        print("  \(index + 1). \(datasetName): \(String(format: "%.0f", complexity)) bytes/operation (\(size) bytes)")
    }
}


