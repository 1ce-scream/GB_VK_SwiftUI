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
    
//    @State var shouldShowText: Bool = false
//    @State var shouldShowPhoto: Bool = false

// MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                
                KFAvatarImage {
                    KFImage(URL(string:self.news.avatarURL!)!)
                }
                
                VStack(alignment: .center) {
                    
                    Text("\(self.news.creatorName!)")
                        .font(.title2)
                    
                    Text("\(self.news.getStringDate())")
                        .font(.subheadline)
                }
                
                Spacer()
            }
                
            Text(self.news.text)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 5)
                .isHidden(self.news.text == "" ,
                          remove: self.news.text == "")
            
            KFImage(URL(string:(self.news.photosURL?.first) ?? ""))
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .isHidden(self.news.photosURL?.first == "" ? true : false,
                          remove: self.news.photosURL?.first == "" ? true : false)
            
            BottomNewsView(
                likeCounter: news.likes.count,
                viewsCounter: news.views.count,
                isLiked: news.likes.userLike,
                ownerId: news.sourceID,
                itemId: news.id)
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
