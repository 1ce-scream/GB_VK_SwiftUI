//
//  News.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import Foundation

class News: Identifiable {
    let postID: Int
    let text: String
    let sourceID: Int
    var avatarURL: String?
    var creatorName: String?
    
    init(postID: Int,
         text: String,
         sourceID: Int,
         avatarURL: String = "",
         creatorName: String = "") {
        
        self.postID = postID
        self.text = text
        self.sourceID = sourceID
        self.avatarURL = avatarURL
        self.creatorName = creatorName
    }
}
