//
//  Community.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import Foundation

class Community: Identifiable {
    let id: Int
    let name: String
    let photo: String
    
    init(id: Int, name: String, photo: String = "") {
        self.id = id
        self.name = name
        self.photo = photo
    }
}
