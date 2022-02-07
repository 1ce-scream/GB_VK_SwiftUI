//
//  NewsListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct NewsListView: View {
 
// MARK: - Properties
    
//    @State var news: [News] = []
//    let text = " Hello world! This is our first News! Text must be huge! That's great! 👌👌👌 Aloha!"
    
    @ObservedObject var viewModel: NewsViewModel

    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
    }
// MARK: - Body
    
    var body: some View {
        
        List(viewModel.news) { news in
            NewsCellView(news: news)
                .listRowSeparatorTint(Color.blue, edges: .all)
        }
        .navigationTitle("\(Tabs.news.rawValue)")
        .onAppear{
            viewModel.getNews()
        }
        
    }
}

// MARK: - Previews

//struct NewsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsListView()
//    }
//}
