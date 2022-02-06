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
    var sizes: [Size]
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
    
}

class Size: Codable {
    @objc dynamic var type: String = ""
    @objc dynamic var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case type
        case url
    }
}

