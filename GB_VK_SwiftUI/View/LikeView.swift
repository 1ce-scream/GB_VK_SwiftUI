//
//  LikeView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 13.02.2022.
//

import SwiftUI

struct LikeView: View {
    @ObservedObject var viewModel: LikeViewModel
    
    @State private var opacity = 1.0
    @State private var degress = 0.0
    
    private var nameHeart: String {
        self.viewModel.isLiked ? "heart.fill" : "heart"
    }
    
    var body: some View {
        HStack {
            
            Text("\(self.viewModel.countLike)")
                .rotation3DEffect(Angle(degrees: self.degress),
                                  axis: (
                                    x: CGFloat(10),
                                    y: CGFloat(0),
                                    z: CGFloat(0)))
            
            Image(systemName: self.nameHeart)
                .foregroundColor(self.viewModel.isLiked ? .red : .none)
                .opacity(self.opacity)
                .onTapGesture {
                    self.viewModel.toggleLike()
                    self.opacity = 0.5
                    withAnimation(.linear(duration: 1)) {
                        self.opacity = 1
                        self.degress = 360
                    }
                    let dispatchTime = DispatchTime.now() + 1
                    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                        self.degress = 0
                    }
                }
        }
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LikeViewModel(countLike: 50,
                                      isLiked2: 0,
                                      ownerId: 1,
                                      itemId: 1,
                                      type: "smth")
        LikeView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
