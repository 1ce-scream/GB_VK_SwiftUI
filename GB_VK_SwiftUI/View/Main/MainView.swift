//
//  MainView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

enum Tabs: String {
    case friends = "Друзья"
    case groups = "Группы"
    case news = "Новости"
}

enum Icon: String {
    case friends = "person.2.fill"
    case group = "person.3.fill"
    case news = "newspaper.fill"
}

struct MainView: View {

// MARK: - Properties
    
    private var userViewModel = UserViewModel()
    private var communityViewModel = CommunityViewModel()
    private var newsViewModel = NewsViewModel()

    
// MARK: - Body
    
    var body: some View {
        
        UITabBarWrapper([
            TabBarElement(tabBarElementItem:
                                .init(title: Tabs.friends.rawValue,
                                      systemImageName: Icon.friends.rawValue)) {
                                          NavigationView {
                                              UsersListView(viewModel: self.userViewModel)
                                          }
                                      },
            TabBarElement(tabBarElementItem:
                                .init(title: Tabs.groups.rawValue,
                                      systemImageName: Icon.group.rawValue)) {
                                          NavigationView {
                                              CommunityListView(viewModel:
                                                            self.communityViewModel)
                                          }
                                      },
            TabBarElement(tabBarElementItem:
                                .init(title: Tabs.news.rawValue,
                                      systemImageName: Icon.news.rawValue)) {
                                          NavigationView {
                                              NewsListView(viewModel: self.newsViewModel)
                                          }
                                      },
        ])
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        
    }
}

// MARK: - Previews

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
