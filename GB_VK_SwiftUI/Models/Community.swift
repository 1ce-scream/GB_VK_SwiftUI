//
//  Community.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import Foundation

class Community: Codable, Identifiable {
    var id: Int
    var name: String
    var photo200: String?
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case photo200 = "photo_200"
        case name
        case description
    }
}
