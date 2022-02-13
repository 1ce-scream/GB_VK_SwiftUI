//
//  CommunityListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct CommunityListView: View {
    
// MARK: - Properties
    
    @ObservedObject var viewModel: CommunityViewModel

    init(viewModel: CommunityViewModel) {
        self.viewModel = viewModel
    }

// MARK: - Body
    
    var body: some View {
        
        List(viewModel.communities) { community in
            CommunityCellView(community: community)
        }
        .background(Color.blue.ignoresSafeArea())
        .navigationTitle("\(Tabs.groups.rawValue)")
        .onAppear{
            viewModel.getCommunities()
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

// MARK: - Previews

//struct CommunityListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommunityListView()
//    }
//}
