//
//  UserViewModel.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 06.02.2022.
//

import Foundation
import Combine
import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    private lazy var networkService = NetworkService()
    
    func getUsers() {
        networkService.getFriends() { users in
            self.users = users
        }
    }
}
