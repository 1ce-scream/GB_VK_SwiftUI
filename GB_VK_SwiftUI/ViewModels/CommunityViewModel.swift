//
//  CommunityViewModel.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 06.02.2022.
//

import Foundation
import Combine

class CommunityViewModel: ObservableObject {
    
//    @Published var communities: [Community] = []
    var communities: [Community] = []
    
    internal let objectWillChange = ObjectWillChangePublisher()
    private let networkService = NetworkService()
    
    func getCommunities() {
        networkService.getCommunities() { [self] communities in
            self.communities = communities
            objectWillChange.send()
        }
    }
}
