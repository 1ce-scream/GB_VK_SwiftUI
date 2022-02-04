//
//  UserListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct UsersListView: View {

// MARK: - Properties
    
    @State var users: [User] = []

// MARK: - Body
    
    var body: some View {
        List(self.users) { user in
            
            NavigationLink(
                destination: UserGalleryView(user: user),
                label: {
                    UserCellView(user: user)
                })
        }
        .navigationTitle("\(Tabs.friends.rawValue)")
        .onAppear {
            self.users = self.fillUsers()
        }
    }

// MARK: - Private methods
    
    private func fillUsers() -> [User] {
        var usersLocal: [User] = []
        for i in 0...100 {
            var photos: [Photo] = []
            for _ in 0...100 {
                photos.append(Photo(name: "StanMarsh"))
            }
            let user = User(id: i,
                            firstName: "Stan",
                            lastName: "Marsh",
                            photo: "StanMarsh",
                            status: .offLine,
                            photos: photos)
            usersLocal.append(user)
        }
        return usersLocal
    }
}

// MARK: - Previews

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}

