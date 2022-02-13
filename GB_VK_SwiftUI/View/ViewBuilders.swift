//
//  ViewBuilders.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 26.01.2022.
//

import SwiftUI
import Kingfisher

struct AvatarImage: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(maxWidth: 50, maxHeight: 50)
            .modifier(AvatarModifier())
    }
}

struct KFAvatarImage: View {
    var content: KFImage
    
    init(@ViewBuilder content: () -> KFImage) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(maxWidth: 50, maxHeight: 50)
            .modifier(AvatarModifier())
            .modifier(AvatarTapAnimationModifier())
    }
}
