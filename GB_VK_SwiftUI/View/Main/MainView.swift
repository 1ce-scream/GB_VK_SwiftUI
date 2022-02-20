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
    
//    @State private var selectedTab: Tabs = .friends
    
    private var userViewModel = UserViewModel()
    private var communityViewModel = CommunityViewModel()
    private var newsViewModel = NewsViewModel()

    
// MARK: - Body
    
    var body: some View {
        
//        MainTabBar(userViewModel: self.userViewModel,
//                   communityViewModel: self.communityViewModel,
//                   newsViewModel: self.newsViewModel)
//            .navigationBarBackButtonHidden(true)
//            .ignoresSafeArea()
        
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
//        TabView(selection: $selectedTab) {
//
//            NavigationView {
//                UsersListView(viewModel: userViewModel)
//            }
//            .tabItem { Label("Друзья", systemImage: "person.2.fill") }
//            .tag(Tabs.friends)
//
//            NavigationView {
//                CommunityListView(viewModel: communityViewModel)
//            }
//            .tabItem { Label("Группы", systemImage: "person.3.fill") }
//            .tag(Tabs.groups)
//
//            NavigationView {
//                NewsListView(viewModel: newsViewModel)
//            }
//            .tabItem { Label("Новости", systemImage: "newspaper.fill") }
//            .tag(Tabs.news)
//        }
//        .navigationTitle(selectedTab.rawValue)
//        .navigationBarBackButtonHidden(true)
//    }
}

// MARK: - Previews

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
