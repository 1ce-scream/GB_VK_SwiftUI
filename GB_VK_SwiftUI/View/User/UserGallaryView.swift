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

    @ObservedObject var gallaryViewModel: UserGallaryViewModel

    init(gallaryViewModel: UserGallaryViewModel) {
        self.gallaryViewModel = gallaryViewModel
    }

// MARK: - Body

    var body: some View {
        ASCollectionView(data: gallaryViewModel.photos) { photo, context in
            
            ZStack(alignment: .bottomTrailing) {
               
                KFImage(URL(string: photo.url))
                    .resizable()
                
                LikeView(viewModel: LikeViewModel(
                    countLike: photo.likesCount,
                    isLiked2: photo.isLiked,
                    ownerId: photo.ownerID,
                    itemId: photo.id,
                    type: "photo"))
                    .background(
                        RoundedRectangle(cornerRadius: 30,
                                         style: .continuous)
                            .fill(.blue)
                            .opacity(0.5)
                    )
            }
        }
        .layout {
            .grid(
                layoutMode: .adaptive(withMinItemSize: 100),
                itemSpacing: 5,
                lineSpacing: 5,
                itemSize: .absolute(100))
        }
        .navigationTitle("Фото")
        .onAppear(perform: gallaryViewModel.getPhotos)
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
