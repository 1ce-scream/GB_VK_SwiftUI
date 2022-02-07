//
//  ViewModifiers.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 26.01.2022.
//

import SwiftUI

struct ButtonsViewModifier: ViewModifier {
    var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 30,
                                 style: .continuous)
                    .fill(.blue)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30,
                                 style: .continuous)
                    .strokeBorder(.white)
            )
            .buttonStyle(.bordered)
            .padding(.bottom, offset)
    }
}

struct MainStackViewModifier: ViewModifier {
    var maxWidth: CGFloat
    var maxHeight: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0,
                   maxWidth: maxWidth,
                   minHeight: 0,
                   maxHeight: maxHeight,
                   alignment: .center)
            .padding(.top, 120.0)
    }
}

struct AvatarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .shadow(color: .black, radius: 5, x: 3, y: 0)
    }
}

struct StatusColorModifire: ViewModifier {
    let status: Status
    
    func body(content: Content) -> some View {
        var color: Color
        
        if status == .onLine {
            color = Color.green
        } else {
            color = Color.red
        }
        return content.foregroundColor(color)
    }
}
