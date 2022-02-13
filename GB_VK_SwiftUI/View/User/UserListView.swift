//
//  UserListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct UsersListView: View {
    
// MARK: - Properties
    
    @ObservedObject var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
// MARK: - Body
    
    var body: some View {
        List(viewModel.users) { user in
            
            NavigationLink(
                destination: UserGalleryView(
                    gallaryViewModel: UserGallaryViewModel(
                        userID: user.id)),
                label: {
                    UserCellView(user: user)
                })
                .listRowSeparatorTint(Color.blue)
        }
        .background(Color.blue.ignoresSafeArea())
        .navigationTitle("\(Tabs.friends.rawValue)")
        .onAppear {
            viewModel.getUsers()
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

// MARK: - Previews

//struct UsersListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UsersListView(viewModel: UserViewModel(networkService: NetworkService()))
//    }
//}
