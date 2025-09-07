// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Welcome
public struct ApacheBuilds: Codable, Equatable {
    let assignedLabels: [OverallLoad]
    let mode: String
    let nodeDescription: String
    let nodeName: String
    let numExecutors: Int
    let welcomeDescription: String
    let jobs: [Job]
    let overallLoad: OverallLoad
    let primaryView: View
    let quietingDown: Bool
    let slaveAgentPort: Int
    let unlabeledLoad: OverallLoad
    let useCrumbs: Bool
    let useSecurity: Bool
    let views: [View]

    enum CodingKeys: String, CodingKey {
        case assignedLabels = "assignedLabels"
        case mode = "mode"
        case nodeDescription = "nodeDescription"
        case nodeName = "nodeName"
        case numExecutors = "numExecutors"
        case welcomeDescription = "description"
        case jobs = "jobs"
        case overallLoad = "overallLoad"
        case primaryView = "primaryView"
        case quietingDown = "quietingDown"
        case slaveAgentPort = "slaveAgentPort"
        case unlabeledLoad = "unlabeledLoad"
        case useCrumbs = "useCrumbs"
        case useSecurity = "useSecurity"
        case views = "views"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - OverallLoad
struct OverallLoad: Codable, Equatable {
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Job
struct Job: Codable, Equatable {
    let name: String
    let url: String
    let color: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case color = "color"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - View
struct View: Codable, Equatable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}


import Ananda
import AnandaMacros
import SwiftyJSON

public enum AnandaApache {
    @AnandaInit
    public struct Model: AnandaModel {
        let assignedLabels: [OverallLoad]
        let mode: String
        let nodeDescription: String
        let nodeName: String
        let numExecutors: Int
        @AnandaKey("description")
        let welcomeDescription: String
        let jobs: [Job]
        let overallLoad: OverallLoad
        let primaryView: View
        let quietingDown: Bool
        let slaveAgentPort: Int
        let unlabeledLoad: OverallLoad
        let useCrumbs: Bool
        let useSecurity: Bool
        let views: [View]
    }

    @AnandaInit
    public struct OverallLoad: AnandaModel {
    }

    @AnandaInit
    public struct Job: AnandaModel {
        let name: String
        let url: String
        let color: String
    }

    @AnandaInit
    public struct View: AnandaModel {
        let name: String
        let url: String
    }
}

public enum SwiftyJSONApache {
    public struct Model {
        let assignedLabels: [OverallLoad]
        let mode: String
        let nodeDescription: String
        let nodeName: String
        let numExecutors: Int
        let welcomeDescription: String
        let jobs: [Job]
        let overallLoad: OverallLoad
        let primaryView: View
        let quietingDown: Bool
        let slaveAgentPort: Int
        let unlabeledLoad: OverallLoad
        let useCrumbs: Bool
        let useSecurity: Bool
        let views: [View]

        init(json: SwiftyJSON.JSON) {
            assignedLabels = json["assignedLabels"].arrayValue.map { OverallLoad(json: $0) }
            mode = json["mode"].stringValue
            nodeDescription = json["nodeDescription"].stringValue
            nodeName = json["nodeName"].stringValue
            numExecutors = json["numExecutors"].intValue
            welcomeDescription = json["description"].stringValue
            jobs = json["jobs"].arrayValue.map { Job(json: $0) }
            overallLoad = OverallLoad(json: json["overallLoad"])
            primaryView = View(json: json["primaryView"])
            quietingDown = json["quietingDown"].boolValue
            slaveAgentPort = json["slaveAgentPort"].intValue
            unlabeledLoad = OverallLoad(json: json["unlabeledLoad"])
            useCrumbs = json["useCrumbs"].boolValue
            useSecurity = json["useSecurity"].boolValue
            views = json["views"].arrayValue.map { View(json: $0) }
        }
    }

    public struct OverallLoad {
        init(json: SwiftyJSON.JSON) {
        }
    }

    public struct Job {
        let name: String
        let url: String
        let color: String
        init(json: SwiftyJSON.JSON) {
            name = json["name"].stringValue
            url = json["url"].stringValue
            color = json["color"].stringValue
        }
    }

    public struct View {
        let name: String
        let url: String
        init(json: SwiftyJSON.JSON) {
            name = json["name"].stringValue
            url = json["url"].stringValue
        }
    }
}

