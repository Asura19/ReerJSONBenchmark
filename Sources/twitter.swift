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
struct Twitter: Codable, Equatable {
    let statuses: [Status]
    let searchMetadata: SearchMetadata

    enum CodingKeys: String, CodingKey {
        case statuses = "statuses"
        case searchMetadata = "search_metadata"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - SearchMetadata
struct SearchMetadata: Codable, Equatable {
    let completedIn: Double
    let maxid: Double
    let maxidStr: String
    let nextResults: String
    let query: String
    let refreshurl: String
    let count: Int
    let sinceid: Int
    let sinceidStr: String

    enum CodingKeys: String, CodingKey {
        case completedIn = "completed_in"
        case maxid = "max_id"
        case maxidStr = "max_id_str"
        case nextResults = "next_results"
        case query = "query"
        case refreshurl = "refresh_url"
        case count = "count"
        case sinceid = "since_id"
        case sinceidStr = "since_id_str"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Status
struct Status: Codable, Equatable {
    let metadata: Metadata
    let createdAt: String
    let id: Double
    let idStr: String
    let text: String
    let source: String
    let truncated: Bool
    let inReplyToStatusid: Double?
    let inReplyToStatusidStr: String?
    let inReplyToUserid: Int?
    let inReplyToUseridStr: String?
    let inReplyToScreenName: String?
    let user: User
    //let geo: NSNull?
    // let coordinates: NSNull?
    // let place: NSNull?
    // let contributors: NSNull?
    let retweetCount: Int
    let favoriteCount: Int
    let entities: StatusEntities
    let favorited: Bool
    let retweeted: Bool
    let lang: String
    // let retweetedStatus: Status?
    let possiblySensitive: Bool?

    enum CodingKeys: String, CodingKey {
        case metadata = "metadata"
        case createdAt = "created_at"
        case id = "id"
        case idStr = "id_str"
        case text = "text"
        case source = "source"
        case truncated = "truncated"
        case inReplyToStatusid = "in_reply_to_status_id"
        case inReplyToStatusidStr = "in_reply_to_status_id_str"
        case inReplyToUserid = "in_reply_to_user_id"
        case inReplyToUseridStr = "in_reply_to_user_id_str"
        case inReplyToScreenName = "in_reply_to_screen_name"
        case user = "user"
        // case geo = "geo"
        // case coordinates = "coordinates"
        // case place = "place"
        // case contributors = "contributors"
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
        case entities = "entities"
        case favorited = "favorited"
        case retweeted = "retweeted"
        case lang = "lang"
        // case retweetedStatus = "retweeted_status"
        case possiblySensitive = "possibly_sensitive"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StatusEntities
struct StatusEntities: Codable, Equatable {
    let hashtags: [Hashtag]
    // let symbols: NSNull
    let urls: [URLElement]
    let userMentions: [UserMention]
    let media: [Media]?

    enum CodingKeys: String, CodingKey {
        case hashtags = "hashtags"
        // case symbols = "symbols"
        case urls = "urls"
        case userMentions = "user_mentions"
        case media = "media"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Hashtag
struct Hashtag: Codable, Equatable {
    let text: String
    let indices: [Int]

    enum CodingKeys: String, CodingKey {
        case text = "text"
        case indices = "indices"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Media
struct Media: Codable, Equatable {
    let id: Double
    let idStr: String
    let indices: [Int]
    let mediaurl: String
    let mediaurlhttps: String
    let url: String
    let displayurl: String
    let expandedurl: String
    let type: String
    let sizes: Sizes
    let sourceStatusid: Double?
    let sourceStatusidStr: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case idStr = "id_str"
        case indices = "indices"
        case mediaurl = "media_url"
        case mediaurlhttps = "media_url_https"
        case url = "url"
        case displayurl = "display_url"
        case expandedurl = "expanded_url"
        case type = "type"
        case sizes = "sizes"
        case sourceStatusid = "source_status_id"
        case sourceStatusidStr = "source_status_id_str"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Sizes
struct Sizes: Codable, Equatable {
    let medium: Large
    let small: Large
    let thumb: Large
    let large: Large

    enum CodingKeys: String, CodingKey {
        case medium = "medium"
        case small = "small"
        case thumb = "thumb"
        case large = "large"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Large
struct Large: Codable, Equatable {
    let w: Int
    let h: Int
    let resize: String

    enum CodingKeys: String, CodingKey {
        case w = "w"
        case h = "h"
        case resize = "resize"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - URLElement
struct URLElement: Codable, Equatable {
    let url: String
    let expandedurl: String
    let displayurl: String
    let indices: [Int]

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case expandedurl = "expanded_url"
        case displayurl = "display_url"
        case indices = "indices"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - UserMention
struct UserMention: Codable, Equatable {
    let screenName: String
    let name: String
    let id: Int
    let idStr: String
    let indices: [Int]

    enum CodingKeys: String, CodingKey {
        case screenName = "screen_name"
        case name = "name"
        case id = "id"
        case idStr = "id_str"
        case indices = "indices"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Metadata
struct Metadata: Codable, Equatable {
    let resultType: String
    let isoLanguageCode: String

    enum CodingKeys: String, CodingKey {
        case resultType = "result_type"
        case isoLanguageCode = "iso_language_code"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - User
struct User: Codable, Equatable {
    let id: Int
    let idStr: String
    let name: String
    let screenName: String
    let location: String
    let userDescription: String
    let url: String?
    let entities: UserEntities
    let protected: Bool
    let followersCount: Int
    let friendsCount: Int
    let listedCount: Int
    let createdAt: String
    let favouritesCount: Int
    let utcOffset: Int?
    let timeZone: String?
    let geoEnabled: Bool
    let verified: Bool
    let statusesCount: Int
    let lang: String
    let contributorsEnabled: Bool
    let isTranslator: Bool
    let isTranslationEnabled: Bool
    let profileBackgroundColor: String
    let profileBackgroundImageurl: String
    let profileBackgroundImageurlhttps: String
    let profileBackgroundTile: Bool
    let profileImageurl: String
    let profileImageurlhttps: String
    let profileBannerurl: String?
    let profileLinkColor: String
    let profileSidebarBorderColor: String
    let profileSidebarFillColor: String
    let profileTextColor: String
    let profileUseBackgroundImage: Bool
    let defaultProfile: Bool
    let defaultProfileImage: Bool
    let following: Bool
    let followRequestSent: Bool
    let notifications: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case idStr = "id_str"
        case name = "name"
        case screenName = "screen_name"
        case location = "location"
        case userDescription = "description"
        case url = "url"
        case entities = "entities"
        case protected = "protected"
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case listedCount = "listed_count"
        case createdAt = "created_at"
        case favouritesCount = "favourites_count"
        case utcOffset = "utc_offset"
        case timeZone = "time_zone"
        case geoEnabled = "geo_enabled"
        case verified = "verified"
        case statusesCount = "statuses_count"
        case lang = "lang"
        case contributorsEnabled = "contributors_enabled"
        case isTranslator = "is_translator"
        case isTranslationEnabled = "is_translation_enabled"
        case profileBackgroundColor = "profile_background_color"
        case profileBackgroundImageurl = "profile_background_image_url"
        case profileBackgroundImageurlhttps = "profile_background_image_url_https"
        case profileBackgroundTile = "profile_background_tile"
        case profileImageurl = "profile_image_url"
        case profileImageurlhttps = "profile_image_url_https"
        case profileBannerurl = "profile_banner_url"
        case profileLinkColor = "profile_link_color"
        case profileSidebarBorderColor = "profile_sidebar_border_color"
        case profileSidebarFillColor = "profile_sidebar_fill_color"
        case profileTextColor = "profile_text_color"
        case profileUseBackgroundImage = "profile_use_background_image"
        case defaultProfile = "default_profile"
        case defaultProfileImage = "default_profile_image"
        case following = "following"
        case followRequestSent = "follow_request_sent"
        case notifications = "notifications"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - UserEntities
struct UserEntities: Codable, Equatable {
    let entitiesDescription: Description
    let url: Description?

    enum CodingKeys: String, CodingKey {
        case entitiesDescription = "description"
        case url = "url"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Description
struct Description: Codable, Equatable {
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case urls = "urls"
    }
}


import Ananda
import AnandaMacros
import SwiftyJSON

public enum AnandaTwitter {
    @AnandaInit
    public struct Model: AnandaModel {
        let statuses: [Status]
        @AnandaKey("search_metadata")
        let searchMetadata: SearchMetadata
    }

    @AnandaInit
    public struct SearchMetadata: AnandaModel {
        @AnandaKey("completed_in")
        let completedIn: Double
        @AnandaKey("max_id")
        let maxid: Double
        @AnandaKey("max_id_str")
        let maxidStr: String
        @AnandaKey("next_results")
        let nextResults: String
        let query: String
        @AnandaKey("refresh_url")
        let refreshurl: String
        let count: Int
        @AnandaKey("since_id")
        let sinceid: Int
        @AnandaKey("since_id_str")
        let sinceidStr: String
    }

    @AnandaInit
    public struct Status: AnandaModel {
        let metadata: Metadata
        @AnandaKey("created_at")
        let createdAt: String
        let id: Double
        @AnandaKey("id_str")
        let idStr: String
        let text: String
        let source: String
        let truncated: Bool
        @AnandaKey("in_reply_to_status_id")
        let inReplyToStatusid: Double?
        @AnandaKey("in_reply_to_status_id_str")
        let inReplyToStatusidStr: String?
        @AnandaKey("in_reply_to_user_id")
        let inReplyToUserid: Int?
        @AnandaKey("in_reply_to_user_id_str")
        let inReplyToUseridStr: String?
        @AnandaKey("in_reply_to_screen_name")
        let inReplyToScreenName: String?
        let user: User
        @AnandaKey("retweet_count")
        let retweetCount: Int
        @AnandaKey("favorite_count")
        let favoriteCount: Int
        let entities: StatusEntities
        let favorited: Bool
        let retweeted: Bool
        let lang: String
        @AnandaKey("possibly_sensitive")
        let possiblySensitive: Bool?
    }

    @AnandaInit
    public struct StatusEntities: AnandaModel {
        let hashtags: [Hashtag]
        let urls: [URLElement]
        @AnandaKey("user_mentions")
        let userMentions: [UserMention]
        let media: [Media]?
    }

    @AnandaInit
    public struct Hashtag: AnandaModel {
        let text: String
        let indices: [Int]
    }

    @AnandaInit
    public struct Media: AnandaModel {
        let id: Double
        @AnandaKey("id_str")
        let idStr: String
        let indices: [Int]
        @AnandaKey("media_url")
        let mediaurl: String
        @AnandaKey("media_url_https")
        let mediaurlhttps: String
        let url: String
        @AnandaKey("display_url")
        let displayurl: String
        @AnandaKey("expanded_url")
        let expandedurl: String
        let type: String
        let sizes: Sizes
        @AnandaKey("source_status_id")
        let sourceStatusid: Double?
        @AnandaKey("source_status_id_str")
        let sourceStatusidStr: String?
    }

    @AnandaInit
    public struct Sizes: AnandaModel {
        let medium: Large
        let small: Large
        let thumb: Large
        let large: Large
    }

    @AnandaInit
    public struct Large: AnandaModel {
        let w: Int
        let h: Int
        let resize: String
    }

    @AnandaInit
    public struct URLElement: AnandaModel {
        let url: String
        @AnandaKey("expanded_url")
        let expandedurl: String
        @AnandaKey("display_url")
        let displayurl: String
        let indices: [Int]
    }

    @AnandaInit
    public struct UserMention: AnandaModel {
        @AnandaKey("screen_name")
        let screenName: String
        let name: String
        let id: Int
        @AnandaKey("id_str")
        let idStr: String
        let indices: [Int]
    }

    @AnandaInit
    public struct Metadata: AnandaModel {
        @AnandaKey("result_type")
        let resultType: String
        @AnandaKey("iso_language_code")
        let isoLanguageCode: String
    }

    @AnandaInit
    public struct User: AnandaModel {
        let id: Int
        @AnandaKey("id_str")
        let idStr: String
        let name: String
        @AnandaKey("screen_name")
        let screenName: String
        let location: String
        @AnandaKey("description")
        let userDescription: String
        let url: String?
        let entities: UserEntities
        let protected: Bool
        @AnandaKey("followers_count")
        let followersCount: Int
        @AnandaKey("friends_count")
        let friendsCount: Int
        @AnandaKey("listed_count")
        let listedCount: Int
        @AnandaKey("created_at")
        let createdAt: String
        @AnandaKey("favourites_count")
        let favouritesCount: Int
        @AnandaKey("utc_offset")
        let utcOffset: Int?
        @AnandaKey("time_zone")
        let timeZone: String?
        @AnandaKey("geo_enabled")
        let geoEnabled: Bool
        let verified: Bool
        @AnandaKey("statuses_count")
        let statusesCount: Int
        let lang: String
        @AnandaKey("contributors_enabled")
        let contributorsEnabled: Bool
        @AnandaKey("is_translator")
        let isTranslator: Bool
        @AnandaKey("is_translation_enabled")
        let isTranslationEnabled: Bool
        @AnandaKey("profile_background_color")
        let profileBackgroundColor: String
        @AnandaKey("profile_background_image_url")
        let profileBackgroundImageurl: String
        @AnandaKey("profile_background_image_url_https")
        let profileBackgroundImageurlhttps: String
        @AnandaKey("profile_background_tile")
        let profileBackgroundTile: Bool
        @AnandaKey("profile_image_url")
        let profileImageurl: String
        @AnandaKey("profile_image_url_https")
        let profileImageurlhttps: String
        @AnandaKey("profile_banner_url")
        let profileBannerurl: String?
        @AnandaKey("profile_link_color")
        let profileLinkColor: String
        @AnandaKey("profile_sidebar_border_color")
        let profileSidebarBorderColor: String
        @AnandaKey("profile_sidebar_fill_color")
        let profileSidebarFillColor: String
        @AnandaKey("profile_text_color")
        let profileTextColor: String
        @AnandaKey("profile_use_background_image")
        let profileUseBackgroundImage: Bool
        @AnandaKey("default_profile")
        let defaultProfile: Bool
        @AnandaKey("default_profile_image")
        let defaultProfileImage: Bool
        let following: Bool
        @AnandaKey("follow_request_sent")
        let followRequestSent: Bool
        let notifications: Bool
    }

    @AnandaInit
    public struct UserEntities: AnandaModel {
        @AnandaKey("description")
        let entitiesDescription: Description
        let url: Description?
    }

    @AnandaInit
    public struct Description: AnandaModel {
        let urls: [URLElement]
    }
}

public enum SwiftyJSONTwitter {
    public struct Model {
        let statuses: [Status]
        let searchMetadata: SearchMetadata

        init(json: SwiftyJSON.JSON) {
            statuses = json["statuses"].arrayValue.map { Status(json: $0) }
            searchMetadata = SearchMetadata(json: json["search_metadata"])
        }
    }

    public struct SearchMetadata {
        let completedIn: Double
        let maxid: Double
        let maxidStr: String
        let nextResults: String
        let query: String
        let refreshurl: String
        let count: Int
        let sinceid: Int
        let sinceidStr: String

        init(json: SwiftyJSON.JSON) {
            completedIn = json["completed_in"].doubleValue
            maxid = json["max_id"].doubleValue
            maxidStr = json["max_id_str"].stringValue
            nextResults = json["next_results"].stringValue
            query = json["query"].stringValue
            refreshurl = json["refresh_url"].stringValue
            count = json["count"].intValue
            sinceid = json["since_id"].intValue
            sinceidStr = json["since_id_str"].stringValue
        }
    }

    public struct Status {
        let metadata: Metadata
        let createdAt: String
        let id: Double
        let idStr: String
        let text: String
        let source: String
        let truncated: Bool
        let inReplyToStatusid: Double?
        let inReplyToStatusidStr: String?
        let inReplyToUserid: Int?
        let inReplyToUseridStr: String?
        let inReplyToScreenName: String?
        let user: User
        let retweetCount: Int
        let favoriteCount: Int
        let entities: StatusEntities
        let favorited: Bool
        let retweeted: Bool
        let lang: String
        let possiblySensitive: Bool?

        init(json: SwiftyJSON.JSON) {
            metadata = Metadata(json: json["metadata"])
            createdAt = json["created_at"].stringValue
            id = json["id"].doubleValue
            idStr = json["id_str"].stringValue
            text = json["text"].stringValue
            source = json["source"].stringValue
            truncated = json["truncated"].boolValue
            inReplyToStatusid = json["in_reply_to_status_id"].double
            inReplyToStatusidStr = json["in_reply_to_status_id_str"].string
            inReplyToUserid = json["in_reply_to_user_id"].int
            inReplyToUseridStr = json["in_reply_to_user_id_str"].string
            inReplyToScreenName = json["in_reply_to_screen_name"].string
            user = User(json: json["user"])
            retweetCount = json["retweet_count"].intValue
            favoriteCount = json["favorite_count"].intValue
            entities = StatusEntities(json: json["entities"])
            favorited = json["favorited"].boolValue
            retweeted = json["retweeted"].boolValue
            lang = json["lang"].stringValue
            possiblySensitive = json["possibly_sensitive"].bool
        }
    }

    public struct StatusEntities {
        let hashtags: [Hashtag]
        let urls: [URLElement]
        let userMentions: [UserMention]
        let media: [Media]?

        init(json: SwiftyJSON.JSON) {
            hashtags = json["hashtags"].arrayValue.map { Hashtag(json: $0) }
            urls = json["urls"].arrayValue.map { URLElement(json: $0) }
            userMentions = json["user_mentions"].arrayValue.map { UserMention(json: $0) }
            media = json["media"].array?.map { Media(json: $0) }
        }
    }

    public struct Hashtag {
        let text: String
        let indices: [Int]

        init(json: SwiftyJSON.JSON) {
            text = json["text"].stringValue
            indices = json["indices"].arrayValue.map { $0.intValue }
        }
    }

    public struct Media {
        let id: Double
        let idStr: String
        let indices: [Int]
        let mediaurl: String
        let mediaurlhttps: String
        let url: String
        let displayurl: String
        let expandedurl: String
        let type: String
        let sizes: Sizes
        let sourceStatusid: Double?
        let sourceStatusidStr: String?

        init(json: SwiftyJSON.JSON) {
            id = json["id"].doubleValue
            idStr = json["id_str"].stringValue
            indices = json["indices"].arrayValue.map { $0.intValue }
            mediaurl = json["media_url"].stringValue
            mediaurlhttps = json["media_url_https"].stringValue
            url = json["url"].stringValue
            displayurl = json["display_url"].stringValue
            expandedurl = json["expanded_url"].stringValue
            type = json["type"].stringValue
            sizes = Sizes(json: json["sizes"])
            sourceStatusid = json["source_status_id"].double
            sourceStatusidStr = json["source_status_id_str"].string
        }
    }

    public struct Sizes {
        let medium: Large
        let small: Large
        let thumb: Large
        let large: Large

        init(json: SwiftyJSON.JSON) {
            medium = Large(json: json["medium"])
            small = Large(json: json["small"])
            thumb = Large(json: json["thumb"])
            large = Large(json: json["large"])
        }
    }

    public struct Large {
        let w: Int
        let h: Int
        let resize: String

        init(json: SwiftyJSON.JSON) {
            w = json["w"].intValue
            h = json["h"].intValue
            resize = json["resize"].stringValue
        }
    }

    public struct URLElement {
        let url: String
        let expandedurl: String
        let displayurl: String
        let indices: [Int]

        init(json: SwiftyJSON.JSON) {
            url = json["url"].stringValue
            expandedurl = json["expanded_url"].stringValue
            displayurl = json["display_url"].stringValue
            indices = json["indices"].arrayValue.map { $0.intValue }
        }
    }

    public struct UserMention {
        let screenName: String
        let name: String
        let id: Int
        let idStr: String
        let indices: [Int]

        init(json: SwiftyJSON.JSON) {
            screenName = json["screen_name"].stringValue
            name = json["name"].stringValue
            id = json["id"].intValue
            idStr = json["id_str"].stringValue
            indices = json["indices"].arrayValue.map { $0.intValue }
        }
    }

    public struct Metadata {
        let resultType: String
        let isoLanguageCode: String

        init(json: SwiftyJSON.JSON) {
            resultType = json["result_type"].stringValue
            isoLanguageCode = json["iso_language_code"].stringValue
        }
    }

    public struct User {
        let id: Int
        let idStr: String
        let name: String
        let screenName: String
        let location: String
        let userDescription: String
        let url: String?
        let entities: UserEntities
        let protected: Bool
        let followersCount: Int
        let friendsCount: Int
        let listedCount: Int
        let createdAt: String
        let favouritesCount: Int
        let utcOffset: Int?
        let timeZone: String?
        let geoEnabled: Bool
        let verified: Bool
        let statusesCount: Int
        let lang: String
        let contributorsEnabled: Bool
        let isTranslator: Bool
        let isTranslationEnabled: Bool
        let profileBackgroundColor: String
        let profileBackgroundImageurl: String
        let profileBackgroundImageurlhttps: String
        let profileBackgroundTile: Bool
        let profileImageurl: String
        let profileImageurlhttps: String
        let profileBannerurl: String?
        let profileLinkColor: String
        let profileSidebarBorderColor: String
        let profileSidebarFillColor: String
        let profileTextColor: String
        let profileUseBackgroundImage: Bool
        let defaultProfile: Bool
        let defaultProfileImage: Bool
        let following: Bool
        let followRequestSent: Bool
        let notifications: Bool

        init(json: SwiftyJSON.JSON) {
            id = json["id"].intValue
            idStr = json["id_str"].stringValue
            name = json["name"].stringValue
            screenName = json["screen_name"].stringValue
            location = json["location"].stringValue
            userDescription = json["description"].stringValue
            url = json["url"].string
            entities = UserEntities(json: json["entities"])
            protected = json["protected"].boolValue
            followersCount = json["followers_count"].intValue
            friendsCount = json["friends_count"].intValue
            listedCount = json["listed_count"].intValue
            createdAt = json["created_at"].stringValue
            favouritesCount = json["favourites_count"].intValue
            utcOffset = json["utc_offset"].int
            timeZone = json["time_zone"].string
            geoEnabled = json["geo_enabled"].boolValue
            verified = json["verified"].boolValue
            statusesCount = json["statuses_count"].intValue
            lang = json["lang"].stringValue
            contributorsEnabled = json["contributors_enabled"].boolValue
            isTranslator = json["is_translator"].boolValue
            isTranslationEnabled = json["is_translation_enabled"].boolValue
            profileBackgroundColor = json["profile_background_color"].stringValue
            profileBackgroundImageurl = json["profile_background_image_url"].stringValue
            profileBackgroundImageurlhttps = json["profile_background_image_url_https"].stringValue
            profileBackgroundTile = json["profile_background_tile"].boolValue
            profileImageurl = json["profile_image_url"].stringValue
            profileImageurlhttps = json["profile_image_url_https"].stringValue
            profileBannerurl = json["profile_banner_url"].string
            profileLinkColor = json["profile_link_color"].stringValue
            profileSidebarBorderColor = json["profile_sidebar_border_color"].stringValue
            profileSidebarFillColor = json["profile_sidebar_fill_color"].stringValue
            profileTextColor = json["profile_text_color"].stringValue
            profileUseBackgroundImage = json["profile_use_background_image"].boolValue
            defaultProfile = json["default_profile"].boolValue
            defaultProfileImage = json["default_profile_image"].boolValue
            following = json["following"].boolValue
            followRequestSent = json["follow_request_sent"].boolValue
            notifications = json["notifications"].boolValue
        }
    }

    public struct UserEntities {
        let entitiesDescription: Description
        let url: Description?

        init(json: SwiftyJSON.JSON) {
            entitiesDescription = Description(json: json["description"])
            url = json["url"].emptyAsNil.map { Description(json: $0) }
        }
    }

    public struct Description {
        let urls: [URLElement]

        init(json: SwiftyJSON.JSON) {
            urls = json["urls"].arrayValue.map { URLElement(json: $0) }
        }
    }
}
