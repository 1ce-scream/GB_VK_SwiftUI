//
//  LikeViewModel.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 13.02.2022.
//

import Foundation

class LikeViewModel: ObservableObject {
    
    @Published var countLike: Int
    @Published var isLiked: Bool
    
    private var isLiked2: Int
    private var ownerId: Int
    private var itemId: Int
    private var type: String
    
    private let networkService = NetworkService()
    
    init(countLike: Int, isLiked2: Int, ownerId: Int, itemId: Int, type: String) {
        self.countLike = countLike
        self.isLiked2 = isLiked2
        self.ownerId = ownerId
        self.itemId = itemId
        self.type = type
        
        if isLiked2 == 0 {
            self.isLiked = false
        } else {
            self.isLiked = true
        }
    }
    
    func toggleLike() {
        isLiked.toggle()
       
        if isLiked {
            countLike += 1
            networkService.addLike(type: "post",
                                   ownerId: self.ownerId,
                                   itemId: self.itemId)
        } else {
            countLike -= 1
            networkService.deleteLike(type: "post",
                                      ownerId: self.ownerId,
                                      itemId: self.itemId)
        }
    }
}
