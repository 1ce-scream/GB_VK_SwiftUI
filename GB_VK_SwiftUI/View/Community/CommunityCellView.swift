//
//  CommunityCellView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 26.01.2022.
//

import SwiftUI
import Kingfisher

struct CommunityCellView: View {

// MARK: - Properties
    
    let community: Community
    
// MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                
                KFAvatarImage {
                    KFImage(URL(string:self.community.photo200)!)
                }
                
                Text("\(self.community.name)")
                    .font(.title2)
                
                Spacer()
            }
            
            Text("\(self.community.description!)")
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
        }
        .listRowSeparatorTint(Color.blue)
    }
}

//MARK: - View Modifiers


// MARK: - Previews

//struct CommunityCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        let community = Community(id: 0,
//                                  name: "Earn your first million",
//                                  photo: "group3")
//        CommunityCellView(community: community)
//            .previewLayout(PreviewLayout.sizeThatFits)
//    }
//}
