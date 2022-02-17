//
//  MainCoordinator.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 17.02.2022.
//

import UIKit
import SwiftUI

class MainCoordinator: UITabBarController {
    
    private var userViewModel = UserViewModel()
    private var communityViewModel = CommunityViewModel()
    private var newsViewModel = NewsViewModel()
    
    
    init() {
        
        self.userViewModel = UserViewModel()
        self.communityViewModel = CommunityViewModel()
        self.newsViewModel = NewsViewModel()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let usersView = UsersListView(viewModel: self.userViewModel)
        let vcUsers = UIHostingController(rootView: usersView)
        let usersTabBarItem = UITabBarItem(
            title: "Друзья",
            image: UIImage(systemName: "person.2.fill"),
            tag: 0)
        vcUsers.tabBarItem = usersTabBarItem
        
        let communityView = CommunityListView(viewModel: self.communityViewModel)
        let vcCommunity = UIHostingController(rootView: communityView)
        let communityTabBarItem = UITabBarItem(
            title: "Группы",
            image: UIImage(systemName: "person.3.fill"),
            tag: 1)
        vcCommunity.tabBarItem = communityTabBarItem
        
        let newsView = NewsListView(viewModel: self.newsViewModel)
        let vcNews = UIHostingController(rootView: newsView)
        let newsTabBarItem = UITabBarItem(
            title: "Новости",
            image: UIImage(systemName: "newspaper.fill"),
            tag: 2)
        vcNews.tabBarItem = newsTabBarItem
        
        let controllers = [vcUsers, vcCommunity, vcNews]
        self.viewControllers = controllers
        self.navigationItem.title = "ssss"
    }
}
