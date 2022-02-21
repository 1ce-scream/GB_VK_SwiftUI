//
//  User.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import Foundation

struct UserItems: Codable {
    var items: [User]
}

struct User: Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var photo200_Orig: String?
    var online: Int
    
    var status: Status {
        get {
            return online == 1 ? Status.onLine : Status.offLine
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, online
        case photo200_Orig = "photo_200_orig"
        case lastName = "last_name"
        case firstName = "first_name"
    }
}
