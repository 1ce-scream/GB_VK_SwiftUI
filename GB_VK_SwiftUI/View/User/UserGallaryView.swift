//
//  UserGallaryView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI
import ASCollectionView

struct UserGalleryView: View {

// MARK: - Properties
    
    let user: User

// MARK: - Body
    
    var body: some View {
        ASCollectionView(data: self.user.photos) { photo, context in
            
            Image(photo.name)
                .resizable()
                .scaledToFit()
            
        }
        .layout {
            .grid(
                layoutMode: .adaptive(withMinItemSize: 100),
                itemSpacing: 5,
                lineSpacing: 5,
                itemSize: .absolute(50))
        }
    }
}


// MARK: - Previews

struct UserGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 0,
                        firstName: "Stan",
                        lastName: "Marsh",
                        photo: "StanMarsh",
                        status: .offLine)
        UserGalleryView(user: user)
    }
}
