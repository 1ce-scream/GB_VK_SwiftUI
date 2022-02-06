//
//  CommunityListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct CommunityListView: View {
    
// MARK: - Properties
    
//    @State var communities: [Community] = []
    
    @ObservedObject var viewModel: CommunityViewModel

    init(viewModel: CommunityViewModel) {
        self.viewModel = viewModel
    }

// MARK: - Body
    
    var body: some View {
        
        List(viewModel.communities) { community in
            CommunityCellView(community: community)
        }
        .navigationTitle("\(Tabs.groups.rawValue)")
        .onAppear{
            viewModel.getCommunities()
        }
    }
}

// MARK: - Previews

//struct CommunityListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommunityListView()
//    }
//}
