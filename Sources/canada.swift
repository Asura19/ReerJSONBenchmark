struct canada: Codable, Equatable {
    let `type`: String
    let `features`: [features]
}

struct features: Codable, Equatable {
    let `type`: String
    let `properties`: properties
    let `geometry`: geometry
}

struct geometry: Codable, Equatable {
    let `type`: String
    let `coordinates`: [[[Double]]]
}

struct properties: Codable, Equatable {
    let `name`: String
}


import Ananda
import AnandaMacros
import SwiftyJSON

public enum AnandaCanada {
//    @AnandaInit
    public struct Model: AnandaModel {
        let type: String
        let features: [Feature]
        
        public init(json: AnandaJSON) {
            self.type = json["type"].string()
            self.features = json["features"].array().map {
                .decode(from: $0)
            }
        }
    }

    @AnandaInit
    public struct Feature: AnandaModel {
        let type: String
        let properties: Property
        let geometry: Geometry
    }

    public struct Geometry: AnandaModel {
        let type: String
        let coordinates: [[[Double]]]
        
        public init(json: AnandaJSON) {
            self.type = json["type"].string()
            let arr = json["coordinates"].array()
            var ret: [[[Double]]] = []
            for i in arr { // i is [[Double]]
                let arr2 = i.array()
                var ret2: [[Double]] = []
                for j in arr2 { // j is [Double]
                    let arr3 = j.array()
                    var ret3: [Double] = []
                    for k in arr3 { // k is Double
                        ret3.append(k.double())
                    }
                    ret2.append(ret3)
                }
                ret.append(ret2)
            }
            self.coordinates = ret
        }
    }

    @AnandaInit
    public struct Property: AnandaModel {
        let name: String
    }
}

public enum SwiftyJSONCanada {
    public struct Model {
        let type: String
        let features: [Feature]

        init(json: SwiftyJSON.JSON) {
            type = json["type"].stringValue
            features = json["features"].arrayValue.map { Feature(json: $0) }
        }
    }

    public struct Feature {
        let type: String
        let properties: Property
        let geometry: Geometry

        init(json: SwiftyJSON.JSON) {
            type = json["type"].stringValue
            properties = Property(json: json["properties"])
            geometry = Geometry(json: json["geometry"])
        }
    }

    public struct Geometry {
        let type: String
        let coordinates: [[[Double]]]

        init(json: SwiftyJSON.JSON) {
            type = json["type"].stringValue
            coordinates = json["coordinates"].arrayValue.map { level1 in
                level1.arrayValue.map { level2 in
                    level2.arrayValue.map { $0.doubleValue }
                }
            }
        }
    }

    public struct Property {
        let name: String
        
        init(json: SwiftyJSON.JSON) {
            name = json["name"].stringValue
        }
    }
}

