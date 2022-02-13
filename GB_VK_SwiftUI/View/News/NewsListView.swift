//
//  NewsListView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct NewsListView: View {
 
// MARK: - Properties
    
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
        .background(Color.blue.ignoresSafeArea())
        .navigationTitle("\(Tabs.news.rawValue)")
        .onAppear{
            viewModel.getNews()
            UITableView.appearance().backgroundColor = .clear
        }
        
    }
}

// MARK: - Previews

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NewsViewModel()
        NewsListView(viewModel: viewModel)
    }
}
