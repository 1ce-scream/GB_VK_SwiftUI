//
//  CommunityListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct CommunityListView: View {
    @State var communities: [Community] = []
    
    var body: some View {
        
        List(self.communities) { community in
            CommunityCellView(community: community)
        }.onAppear{
            self.communities = self.fillCommunities()
        }
    }
    
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

struct CommunityListView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityListView()
    }
}
