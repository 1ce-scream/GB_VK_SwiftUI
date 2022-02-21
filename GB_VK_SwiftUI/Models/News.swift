//
//  News.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import UIKit

struct NewsResponse: Codable {
    var items: NewsItems
    var profiles: NewsProfiles
    var groups: NewsCommunity
    
    enum CodingKeys: String, CodingKey {
        case items, profiles, groups
    }
}

struct NewsModel: Codable, Identifiable {
    var id: Int
    var text: String
    var date: Double
    var attachments: [Attachment]?
    var likes: LikeModel
    var sourceID: Int
    var views: ViewsModel
    var avatarURL: String?
    var creatorName: String?
    var photosURL: [String]? {
        get {
            let photosURL = attachments?.compactMap{ $0.photo?.sizes?.last?.url }
            return photosURL
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "post_id"
        case text
        case date
        case likes
        case attachments
        case sourceID = "source_id"
        case avatarURL
        case views
        case creatorName
    }
    
    func getStringDate() -> String {
        let dateFormatter = DateFormatterVK()
        return dateFormatter.convertDate(timeIntervalSince1970: date)
    }
}

struct Attachment: Codable {
    var type: String?
    var photo: PhotoNews?
}

struct LikeModel: Codable {
    var count: Int
    var userLike: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLike = "user_likes"
    }
}

struct ViewsModel: Codable {
    var count: Int
}

struct PhotoNews: Codable {
    var id: Int?
    var ownerID: Int?
    var sizes: [SizeNews]?

    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
}

struct SizeNews: Codable {
    var type: String?
    var url: String?
    var width: Double
    var height: Double
    var aspectRatio: CGFloat { width / height }
}

struct NewsProfiles: Codable {
    var profiles: [User]
}

struct NewsCommunity: Codable {
    var groups: [Community]
}

struct NewsItems: Codable {
    var items: [NewsModel]
}
