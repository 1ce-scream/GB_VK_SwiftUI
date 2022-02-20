//
//  UserGallaryView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI
import Kingfisher

struct UserGalleryView: View {

// MARK: - Properties

    @ObservedObject var gallaryViewModel: UserGallaryViewModel

    private let columns: [GridItem] = [
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    init(gallaryViewModel: UserGallaryViewModel) {
        self.gallaryViewModel = gallaryViewModel
    }

// MARK: - Body
    var body: some View {
        ScrollView(.vertical) {
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 8) {
                
                ForEach(self.gallaryViewModel.photos) { photo in
                    
                    ZStack(alignment: .bottomTrailing) {
                        
                        KFImage(URL(string: photo.url))
                            .cancelOnDisappear(true)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100, alignment: .center)
                        
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
            }
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
