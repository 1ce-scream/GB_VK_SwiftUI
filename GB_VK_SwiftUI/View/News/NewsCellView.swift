//
//  NewsCellView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct NewsCellView: View {

// MARK: - Properties

    let news: NewsModel

// MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                
                AvatarImage {
                    Image(self.news.avatarURL!)
                }
                
                Text("\(self.news.creatorName!)")
                    .font(.title2)
                
                Spacer()
            }
            
            Text(self.news.text)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 5)
            
            BottomNewsView()
        }
    }
}

// MARK: - Views

struct BottomNewsView: View {
    
    var body: some View {
        HStack(alignment: .center) {
            
            Text("Просмотров: 100")
            
            Spacer()
            
            Image(systemName: "heart")
                .foregroundColor(Color.red)
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
