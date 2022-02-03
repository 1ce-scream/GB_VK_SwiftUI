//
//  User.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import Foundation

class User: Identifiable {
    var id: Int
    let firstName: String
    let lastName: String
    var status: Status
    let photo: String
    let photos: [Photo]
    
    init(id: Int,
         firstName: String,
         lastName: String,
         photo: String = "",
         status: Status = .offLine,
         photos: [Photo] = []) {
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.status = status
        self.photo = photo
        self.photos = photos
    }
}
