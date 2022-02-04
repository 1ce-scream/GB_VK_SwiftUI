//
//  UserCellView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 26.01.2022.
//

import SwiftUI

struct UserCellView: View {
    
// MARK: - Properties
    
    let user: User
    
// MARK: - Body

    var body: some View {
        HStack {
            
            AvatarImage {
                Image(self.user.photo)
            }
            
            VStack(alignment: .leading) {
                
                Text("\(self.user.firstName) \(self.user.lastName)")
                    .font(.title2)
               
                Text("\(self.user.status.rawValue)")
                    .font(.subheadline)
                    .statusColorModifire(status: self.user.status)
            }
            Spacer()
        }
//        .border(Color.gray)
    }
}

// MARK: - ViewBuilders


//MARK: - View Modifiers


// MARK: - Previews
struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 0,
                        firstName: "Stan",
                        lastName: "Marsh",
                        photo: "StanMarsh",
                        status: .offLine)
        UserCellView(user: user)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
