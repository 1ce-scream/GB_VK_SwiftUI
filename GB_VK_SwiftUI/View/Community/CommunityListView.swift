//
//  CommunityListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct CommunityListView: View {
    
// MARK: - Properties
    
    @State var communities: [Community] = []

// MARK: - Body
    
    var body: some View {
        
        List(self.communities) { community in
            CommunityCellView(community: community)
        }
        .navigationTitle("\(Tabs.groups.rawValue)")
        .onAppear{
            self.communities = self.fillCommunities()
        }
    }
 
// MARK: - Private methods
    
    private func fillCommunities() -> [Community] {
        var communitiesLocal: [Community] = []
        for i in 0...100 {
            let community = Community(id: i,
                                      name: "\(i) Earn your first million",
                                      photo: "group3")
            communitiesLocal.append(community)
        }
        return communitiesLocal
    }
}

// MARK: - Previews

struct CommunityListView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityListView()
    }
}
