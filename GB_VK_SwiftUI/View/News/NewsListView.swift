//
//  NewsListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct NewsListView: View {
    
    @State var news: [News] = []
    let text = " Hello world! This is our first News! Text must be huge! That's great! 👌👌👌 Aloha!"
    var body: some View {
        
        List(self.news) { news in
            NewsCellView(news: news)
        }.onAppear{
            self.news = self.fillNews()
        }
        
    }
    
    private func fillNews() -> [News] {
        var newsLocal: [News] = []
        for i in 0...100 {
            let news = News(postID: i,
                            text: self.text,
                            sourceID: 1,
                            avatarURL: "group1",
                            creatorName: "The best group ever")
            newsLocal.append(news)
        }
        return newsLocal
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
