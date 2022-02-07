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

struct MainView: View {

// MARK: - Properties
    
    @State private var selectedTab: Tabs = .friends
    @ObservedObject var userViewModel = UserViewModel()
    @ObservedObject var communityViewModel = CommunityViewModel()
    @ObservedObject var newsViewModel = NewsViewModel()

    let networkService = NetworkService()
    
// MARK: - Body
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
           
            NavigationView {
                UsersListView(viewModel: userViewModel)
            }
            .tabItem { Label("Друзья", systemImage: "person.2.fill") }
            .tag(Tabs.friends)
            
            NavigationView {
                CommunityListView(viewModel: communityViewModel)
            }
            .tabItem { Label("Группы", systemImage: "person.3.fill") }
            .tag(Tabs.groups)
            
            NavigationView {
                NewsListView(viewModel: newsViewModel)
            }
            .tabItem { Label("Новости", systemImage: "newspaper.fill") }
            .tag(Tabs.news)
        }
        .navigationTitle(selectedTab.rawValue)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Previews

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
