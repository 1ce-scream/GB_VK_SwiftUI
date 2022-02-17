//
//  MainTabBarController.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 17.02.2022.
//

import UIKit
import SwiftUI

struct MainTabBar: UIViewControllerRepresentable {
    
    var userViewModel: UserViewModel
    var communityViewModel: CommunityViewModel
    var newsViewModel: NewsViewModel
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UITabBarController()
        let controllers = setControllers()
        controller.viewControllers = controllers
        controller.delegate = context.coordinator

        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        let controllers = setControllers()

        uiViewController.tabBarController?.setViewControllers(
            controllers,
            animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITabBarControllerDelegate {
        var mainTabBar: MainTabBar

        init(_ tabBarController: MainTabBar) {
            mainTabBar = tabBarController
        }
    }
    
    func setControllers() -> [UIViewController] {
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
        
        return controllers
    }
}
