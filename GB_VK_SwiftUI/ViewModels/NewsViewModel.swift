//
//  NewsViewModel.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 07.02.2022.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    
    @Published var news: [NewsModel] = []
    
    private let networkService = NetworkService()
    
    func getNews() {
        networkService.getNews() { newsResponse in
            
            for itemNews in newsResponse.items.items {
                
                var creatorName: String = ""
                var photoURL: String = ""
                
                if itemNews.sourceID > 0 {
                    // profile
                    if let profile = newsResponse.profiles.profiles
                        .first(where: { $0.id == abs(itemNews.sourceID) }) {
                        
                        creatorName = "\(profile.lastName) \(profile.firstName)"
                        photoURL = profile.photo200_Orig ?? ""
                    }
                } else {
                    // community
                    if let group = newsResponse.groups.groups
                        .first(where: { $0.id == abs(itemNews.sourceID) }) {
                        
                        creatorName = group.name
                        photoURL = group.photo200
                    }
                }
                
                self.news.append(NewsModel(
                    id: itemNews.id,
                    text: itemNews.text,
                    date: itemNews.date,
                    attachments: itemNews.attachments,
                    likes: itemNews.likes,
                    sourceID: itemNews.sourceID,
                    views: itemNews.views,
                    avatarURL: photoURL,
                    creatorName: creatorName))
            }
        }
    }
}
