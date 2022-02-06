//
//  UserGallaryView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI
import ASCollectionView
import Kingfisher

struct UserGalleryView: View {

// MARK: - Properties

    @ObservedObject var viewModel: UserGallaryViewModel

    init(viewModel: UserGallaryViewModel) {
        self.viewModel = viewModel
    }

// MARK: - Body

    var body: some View {
//        Text("Hello")
        ASCollectionView(data: viewModel.photos) { photo, context in
            KFImage(URL(string: photo.sizes.first!.url))
//            Image(photo.name)
//                .resizable()
//                .scaledToFit()
            
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

//struct UserGalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        let user = User(id: 0,
//                        firstName: "Stan",
//                        lastName: "Marsh",
//                        photo: "StanMarsh",
//                        status: .offLine)
//        UserGalleryView(user: user)
//    }
//}
