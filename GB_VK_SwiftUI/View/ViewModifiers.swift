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

struct StatusColorModifier: ViewModifier {
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

struct AvatarTapAnimationModifier: ViewModifier {
    @State var scale: CGFloat = 1
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(self.scale)
            .animation(Animation.interpolatingSpring(
                mass: 2,
                stiffness: 50,
                damping: 6,
                initialVelocity: 0.5), value: scale)
        
            .onTapGesture {
                withAnimation(.linear(duration: 0.3)) {
                    //уменьшение
                    self.scale = 0.7
                    
                    //отпружинивание
                    var dispatchTime = DispatchTime.now() + 0.7
                    
                    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                        self.scale = 1.2
                    }
                    
                    //возврат в исходное состояние немного попружинив
                    dispatchTime = dispatchTime + 0.7
                    
                    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                        self.scale = 1
                    }
                }
            }
    }
}
