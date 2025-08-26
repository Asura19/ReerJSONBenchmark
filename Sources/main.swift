// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ReerJSON
import ZippyJSON
import IkigaJSON

struct Event: Decodable {
    struct Actor: Decodable {
        let gravatarID: String
        let login: String
        let avatarURL: URL
        let url: URL
        let id: Int

        private enum CodingKeys: String, CodingKey {
            case gravatarID = "gravatar_id"
            case login
            case avatarURL = "avatar_url"
            case url
            case id
        }
    }

    struct Repo: Decodable {
        let url: URL
        let id: Int
        let name: String
    }

    struct Payload: Decodable {
        struct Commit: Decodable {
            struct Author: Decodable {
                let email: String
                let name: String
            }

            let url: URL
            let message: String
            let distinct: Bool
            let sha: String
            let author: Author
        }

        struct Forkee: Decodable {
            struct Owner: Decodable {
                let url: URL
                let gistsURL: URL
                let gravatarID: String
                let type: String
                let avatarURL: URL
                let subscriptionsURL: URL
                let organizationsURL: URL
                let receivedEventsURL: URL
                let reposURL: URL
                let login: String
                let id: Int
                let starredURL: URL
                let eventsURL: URL
                let followersURL: URL
                let followingURL: URL

                private enum CodingKeys: String, CodingKey {
                    case url
                    case gistsURL = "gists_url"
                    case gravatarID = "gravatar_id"
                    case type
                    case avatarURL = "avatar_url"
                    case subscriptionsURL = "subscriptions_url"
                    case organizationsURL = "organizations_url"
                    case receivedEventsURL = "received_events_url"
                    case reposURL = "repos_url"
                    case login
                    case id
                    case starredURL = "starred_url"
                    case eventsURL = "events_url"
                    case followersURL = "followers_url"
                    case followingURL = "following_url"
                }
            }

            let description: String
            let fork: Bool
            let url: URL
            let language: String
            let stargazersURL: URL
            let cloneURL: URL
            let tagsURL: URL
            let fullName: String
            let mergesURL: URL
            let forks: Int
            let `private`: Bool
            let gitRefsURL: URL
            let archiveURL: URL
            let collaboratorsURL: URL
            let owner: Owner
            let languagesURL: URL
            let treesURL: URL
            let labelsURL: URL
            let htmlURL: URL
            let pushedAt: Date
            let createdAt: Date
            let hasIssues: Bool
            let forksURL: URL
            let branchesURL: URL
            let commitsURL: URL
            let notificationsURL: URL
            let openIssues: Int
            let contentsURL: URL
            let blobsURL: URL
            let issuesURL: URL
            let compareURL: URL
            let issueEventsURL: URL
            let name: String
            let updatedAt: Date
            let statusesURL: URL
            let forksCount: Int
            let assigneesURL: URL
            let sshURL: String
            let `public`: Bool
            let hasWiki: Bool
            let subscribersURL: URL
            let watchersCount: Int
            let id: Int
            let hasDownloads: Bool
            let gitCommitsURL: URL
            let downloadsURL: URL
            let pullsURL: URL
            let homepage: String?
            let issueCommentURL: URL
            let hooksURL: URL
            let subscriptionURL: URL
            let milestonesURL: URL
            let svnURL: URL
            let eventsURL: URL
            let gitTagsURL: URL
            let teamsURL: URL
            let commentsURL: URL
            let openIssuesCount: Int
            let keysURL: URL
            let gitURL: URL
            let contributorsURL: URL
            let size: Int
            let watchers: Int

            private enum CodingKeys: String, CodingKey {
                case description
                case fork
                case url
                case language
                case stargazersURL = "stargazers_url"
                case cloneURL = "clone_url"
                case tagsURL = "tags_url"
                case fullName = "full_name"
                case mergesURL = "merges_url"
                case forks
                case `private`
                case gitRefsURL = "git_refs_url"
                case archiveURL = "archive_url"
                case collaboratorsURL = "collaborators_url"
                case owner
                case languagesURL = "languages_url"
                case treesURL = "trees_url"
                case labelsURL = "labels_url"
                case htmlURL = "html_url"
                case pushedAt = "pushed_at"
                case createdAt = "created_at"
                case hasIssues = "has_issues"
                case forksURL = "forks_url"
                case branchesURL = "branches_url"
                case commitsURL = "commits_url"
                case notificationsURL = "notifications_url"
                case openIssues = "open_issues"
                case contentsURL = "contents_url"
                case blobsURL = "blobs_url"
                case issuesURL = "issues_url"
                case compareURL = "compare_url"
                case issueEventsURL = "issue_events_url"
                case name
                case updatedAt = "updated_at"
                case statusesURL = "statuses_url"
                case forksCount = "forks_count"
                case assigneesURL = "assignees_url"
                case sshURL = "ssh_url"
                case `public`
                case hasWiki = "has_wiki"
                case subscribersURL = "subscribers_url"
                case watchersCount = "watchers_count"
                case id
                case hasDownloads = "has_downloads"
                case gitCommitsURL = "git_commits_url"
                case downloadsURL = "downloads_url"
                case pullsURL = "pulls_url"
                case homepage
                case issueCommentURL = "issue_comment_url"
                case hooksURL = "hooks_url"
                case subscriptionURL = "subscription_url"
                case milestonesURL = "milestones_url"
                case svnURL = "svn_url"
                case eventsURL = "events_url"
                case gitTagsURL = "git_tags_url"
                case teamsURL = "teams_url"
                case commentsURL = "comments_url"
                case openIssuesCount = "open_issues_count"
                case keysURL = "keys_url"
                case gitURL = "git_url"
                case contributorsURL = "contributors_url"
                case size
                case watchers
            }
        }

        struct Issue: Decodable {
            struct User: Decodable {
                let url: URL
                let gistsURL: URL
                let gravatarID: String
                let type: String
                let avatarURL: URL
                let subscriptionsURL: URL
                let receivedEventsURL: URL
                let organizationsURL: URL
                let reposURL: URL
                let login: String
                let id: Int
                let starredURL: URL
                let eventsURL: URL
                let followersURL: URL
                let followingURL: URL

                private enum CodingKeys: String, CodingKey {
                    case url
                    case gistsURL = "gists_url"
                    case gravatarID = "gravatar_id"
                    case type
                    case avatarURL = "avatar_url"
                    case subscriptionsURL = "subscriptions_url"
                    case receivedEventsURL = "received_events_url"
                    case organizationsURL = "organizations_url"
                    case reposURL = "repos_url"
                    case login
                    case id
                    case starredURL = "starred_url"
                    case eventsURL = "events_url"
                    case followersURL = "followers_url"
                    case followingURL = "following_url"
                }
            }

            struct Assignee: Decodable {
                let url: URL
                let gistsURL: URL
                let gravatarID: String
                let type: String
                let avatarURL: URL
                let subscriptionsURL: URL
                let organizationsURL: URL
                let receivedEventsURL: URL
                let reposURL: URL
                let login: String
                let id: Int
                let starredURL: URL
                let eventsURL: URL
                let followersURL: URL
                let followingURL: URL

                private enum CodingKeys: String, CodingKey {
                    case url
                    case gistsURL = "gists_url"
                    case gravatarID = "gravatar_id"
                    case type
                    case avatarURL = "avatar_url"
                    case subscriptionsURL = "subscriptions_url"
                    case organizationsURL = "organizations_url"
                    case receivedEventsURL = "received_events_url"
                    case reposURL = "repos_url"
                    case login
                    case id
                    case starredURL = "starred_url"
                    case eventsURL = "events_url"
                    case followersURL = "followers_url"
                    case followingURL = "following_url"
                }
            }

            let user: User
            let url: URL
            let htmlURL: URL
            let labelsURL: URL
            let createdAt: Date
            let closedAt: Date?
            let title: String
            let body: String
            let updatedAt: Date
            let number: Int
            let state: String
            let assignee: Assignee?
            let id: Int
            let eventsURL: URL
            let commentsURL: URL
            let comments: Int

            private enum CodingKeys: String, CodingKey {
                case user
                case url
                case htmlURL = "html_url"
                case labelsURL = "labels_url"
                case createdAt = "created_at"
                case closedAt = "closed_at"
                case title
                case body
                case updatedAt = "updated_at"
                case number
                case state
                case assignee
                case id
                case eventsURL = "events_url"
                case commentsURL = "comments_url"
                case comments
            }
        }

        struct Comment: Decodable {
            struct User: Decodable {
                let url: URL
                let gistsURL: URL
                let gravatarID: String
                let type: String
                let avatarURL: URL
                let subscriptionsURL: URL
                let receivedEventsURL: URL
                let organizationsURL: URL
                let reposURL: URL
                let login: String
                let id: Int
                let starredURL: URL
                let eventsURL: URL
                let followersURL: URL
                let followingURL: URL

                private enum CodingKeys: String, CodingKey {
                    case url
                    case gistsURL = "gists_url"
                    case gravatarID = "gravatar_id"
                    case type
                    case avatarURL = "avatar_url"
                    case subscriptionsURL = "subscriptions_url"
                    case receivedEventsURL = "received_events_url"
                    case organizationsURL = "organizations_url"
                    case reposURL = "repos_url"
                    case login
                    case id
                    case starredURL = "starred_url"
                    case eventsURL = "events_url"
                    case followersURL = "followers_url"
                    case followingURL = "following_url"
                }
            }

            let user: User
            let url: URL
            let issueURL: URL
            let createdAt: Date
            let body: String
            let updatedAt: Date
            let id: Int

            private enum CodingKeys: String, CodingKey {
                case user
                case url
                case issueURL = "issue_url"
                case createdAt = "created_at"
                case body
                case updatedAt = "updated_at"
                case id
            }
        }

        struct Page: Decodable {
            let pageName: String
            let htmlURL: URL
            let title: String
            let sha: String
            let action: String

            private enum CodingKeys: String, CodingKey {
                case pageName = "page_name"
                case htmlURL = "html_url"
                case title
                case sha
                case action
            }
        }

        let commits: [Commit]?
        let distinctSize: Int?
        let ref: String?
        let pushID: Int?
        let head: String?
        let before: String?
        let size: Int?
        let description: String?
        let masterBranch: String?
        let refType: String?
        let forkee: Forkee?
        let action: String?
        let issue: Issue?
        let comment: Comment?
        let pages: [Page]?

        private enum CodingKeys: String, CodingKey {
            case commits
            case distinctSize = "distinct_size"
            case ref
            case pushID = "push_id"
            case head
            case before
            case size
            case description
            case masterBranch = "master_branch"
            case refType = "ref_type"
            case forkee
            case action
            case issue
            case comment
            case pages
        }
    }

    struct Org: Decodable {
        let gravatarID: String
        let login: String
        let avatarURL: URL
        let url: URL
        let id: Int

        private enum CodingKeys: String, CodingKey {
            case gravatarID = "gravatar_id"
            case login
            case avatarURL = "avatar_url"
            case url
            case id
        }
    }

    let type: String
    let createdAt: Date
    let `actor`: Actor
    let repo: Repo
    let `public`: Bool
    let payload: Payload
    let id: String
    let org: Org?

    private enum CodingKeys: String, CodingKey {
        case type
        case createdAt = "created_at"
        case `actor`
        case repo
        case `public`
        case payload
        case id
        case org
    }
}

let githubEventsJSONData: Data = {
    let url = Bundle.module.url(forResource: "github_events", withExtension: "json")!
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
            if i % 2 == 0 || i == iterations {
                print("  Completed \(i)/\(iterations) tests")
            }
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

// Run all benchmarks
func runAllBenchmarks() {
    print("🚀 Starting GitHub Events JSON Decoding Benchmark")
    print("Data size: \(githubEventsJSONData.count) bytes")
    print(String(repeating: "=", count: 60))
    
    let iterations = 5000 // Number of test iterations
    var results: [BenchmarkResult] = []
    
    // 1. Foundation JSONDecoder
    let foundationDecoder = Foundation.JSONDecoder()
    foundationDecoder.dateDecodingStrategy = .iso8601
    let foundationResult = benchmark(
        name: "Foundation JSONDecoder",
        decoder: foundationDecoder,
        jsonData: githubEventsJSONData,
        type: [Event].self,
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
        jsonData: githubEventsJSONData,
        type: [Event].self,
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
        jsonData: githubEventsJSONData,
        type: [Event].self,
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
        jsonData: githubEventsJSONData,
        type: [Event].self,
        iterations: iterations
    )
    results.append(ikigaResult)
    
    print()
    print(String(repeating: "=", count: 60))
    print("📊 Benchmark Results Summary")
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

// MARK: - Main

runAllBenchmarks()
