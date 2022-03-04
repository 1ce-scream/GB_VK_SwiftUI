//
//  UserGallaryViewModel.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 06.02.2022.
//

import Foundation
import Combine
//import Kingfisher

class UserGallaryViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    var userID: Int
    private lazy var networkService = NetworkService()
    
    init(userID: Int) {
        self.userID = userID
    }
    
    func getPhotos() {
        networkService.getPhoto(for: self.userID) { photos in
            self.photos = photos
        }
    }
}
