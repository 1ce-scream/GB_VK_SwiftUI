//
//  UserViewModel.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 06.02.2022.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    private let networkService = NetworkService()
    
//    init(networkService: NetworkService) {
//        self.networkService = networkService
//    }
    
    func getUsers() {
        networkService.getFriends() { users in
            self.users = users
        }
    }
}
