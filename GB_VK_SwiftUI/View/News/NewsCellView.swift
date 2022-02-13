//
//  NewsCellView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI
import Kingfisher

struct NewsCellView: View {

// MARK: - Properties

    let news: NewsModel

// MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                
                KFAvatarImage {
                    KFImage(URL(string:self.news.avatarURL!)!)
                }
                
                Text("\(self.news.creatorName!)")
                    .font(.title2)
                
                Spacer()
            }
            
            Text(self.news.text)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 5)
            
            BottomNewsView(
                likeCounter: news.likes.count,
                viewsCounter: news.views.count,
                isLiked: news.likes.userLike,
                ownerId: news.sourceID,
                itemId: news.postID)
        }
    }
}

// MARK: - Views

struct BottomNewsView: View {
    var likeCounter: Int
    var viewsCounter: Int
    var isLiked: Int
    var ownerId: Int
    var itemId: Int
    
    var body: some View {
        HStack(alignment: .center) {
            
            Text("Просмотров: \(viewsCounter)")
            
            Spacer()
            
            LikeView(viewModel: LikeViewModel(countLike: likeCounter,
                                              isLiked2: isLiked,
                                             ownerId: ownerId,
                                             itemId: itemId,
                                             type: "post"))
        }
    }
}

// MARK: - Previews

//struct NewsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        let news = News(postID: 0,
//                        text: "Hello world!",
//                        sourceID: 1,
//                        avatarURL: "group1",
//                        creatorName: "The best group ever")
//        NewsCellView(news: news)
//            .previewLayout(PreviewLayout.sizeThatFits)
//    }
//}
//
