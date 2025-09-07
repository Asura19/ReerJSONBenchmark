struct random: Codable, Equatable {
    let `id`: Int
    let `jsonrpc`: String
    let `total`: Int
    let `result`: [result]
}

struct result: Codable, Equatable {
    let `id`: Int
    let `avatar`: String
    let `age`: Int
    let `admin`: Bool
    let `name`: String
    let `company`: String
    let `phone`: String
    let `email`: String
    let `birthDate`: String
    let `friends`: [friends]
    let `field`: String
}

struct friends: Codable, Equatable {
    let `id`: Int
    let `name`: String
    let `phone`: String
}

import Ananda
import AnandaMacros
import SwiftyJSON

public enum AnandaRandom {
    @AnandaInit
    public struct Model: AnandaModel {
        let id: Int
        let jsonrpc: String
        let total: Int
        let result: [Result]
    }

    @AnandaInit
    public struct Result: AnandaModel {
        let id: Int
        let avatar: String
        let age: Int
        let admin: Bool
        let name: String
        let company: String
        let phone: String
        let email: String
        let birthDate: String
        let friends: [Friend]
        let field: String
    }

    @AnandaInit
    public struct Friend: AnandaModel {
        let id: Int
        let name: String
        let phone: String
    }
}

public enum SwiftyJSONRandom {
    public struct Model {
        let id: Int
        let jsonrpc: String
        let total: Int
        let result: [Result]

        init(json: SwiftyJSON.JSON) {
            id = json["id"].intValue
            jsonrpc = json["jsonrpc"].stringValue
            total = json["total"].intValue
            result = json["result"].arrayValue.map { Result(json: $0) }
        }
    }

    public struct Result {
        let id: Int
        let avatar: String
        let age: Int
        let admin: Bool
        let name: String
        let company: String
        let phone: String
        let email: String
        let birthDate: String
        let friends: [Friend]
        let field: String

        init(json: SwiftyJSON.JSON) {
            id = json["id"].intValue
            avatar = json["avatar"].stringValue
            age = json["age"].intValue
            admin = json["admin"].boolValue
            name = json["name"].stringValue
            company = json["company"].stringValue
            phone = json["phone"].stringValue
            email = json["email"].stringValue
            birthDate = json["birthDate"].stringValue
            friends = json["friends"].arrayValue.map { Friend(json: $0) }
            field = json["field"].stringValue
        }
    }

    public struct Friend {
        let id: Int
        let name: String
        let phone: String

        init(json: SwiftyJSON.JSON) {
            id = json["id"].intValue
            name = json["name"].stringValue
            phone = json["phone"].stringValue
        }
    }
}

