//
//  CommunityCellView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 26.01.2022.
//

import SwiftUI

struct CommunityCellView: View {

// MARK: - Properties
    
    let community: Community
    
// MARK: - Body
    
    var body: some View {
        HStack {
            
            AvatarImage {
                Image(self.community.photo)
            }
            
            Text("\(self.community.name)")
                .font(.title2)
            
            Spacer()
        }
    }
}

//MARK: - View Modifiers


// MARK: - Previews

struct CommunityCellView_Previews: PreviewProvider {
    static var previews: some View {
        let community = Community(id: 0,
                                  name: "Earn your first million",
                                  photo: "group3")
        CommunityCellView(community: community)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
