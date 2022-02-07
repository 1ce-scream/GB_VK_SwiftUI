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
//    private var next_from: String = ""
    
//    init(networkService: NetworkService) {
//        self.networkService = networkService
//    }
    
    func getNews() {
        networkService.getNews() { news in
            self.news = news
//            self.next_from = next_from!
        }
    }
}
