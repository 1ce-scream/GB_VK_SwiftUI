//
//  Photo.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import Foundation

class Photo: Codable, Identifiable {
    var id: Int
    var ownerID: Int
    var likesCount: Int = 0
    var isLiked: Int = 0
    var url: String = ""
    
    var sizes: [Size]
    var likes: Likes? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
    
}

class Size: Codable {
    var type: String = ""
    var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case type
        case url
    }
}

class Likes: Codable {
    @objc dynamic var userLikes: Int = 0
    @objc dynamic var count: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
