//
//  UserCellView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 26.01.2022.
//

import SwiftUI

struct UserCellView: View {
    let name: String = "Stan Marsh"
    let status: String = "offline"
    let avatarName: String = "StanMarsh"
    
    var body: some View {
        HStack {
            AvatarImage {
                Image(avatarName)
            }
            VStack(alignment: .leading) {
                Text("\(name)")
                    .font(.title2)
                Text("\(status)")
                    .font(.system(size: 12))
            }
            Spacer()
        }
//        .border(Color.gray)
    }
}

// MARK: - ViewBuilders

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

//MARK: -View Modifiers
struct AvatarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 5)
            .clipShape(Circle())
            .shadow(color: .black, radius: 5, x: 3, y: 0)
    }
}

// MARK: -Previews
struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
    }
}
