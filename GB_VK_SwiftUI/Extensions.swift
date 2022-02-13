//
//  Extensions.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

extension View {
    func statusColorModifire(status: Status) -> some View {
        self.modifier(StatusColorModifire(status: status))
    }
    
    func avatarTapAnimationModifier() -> some View {
        self.modifier(AvatarTapAnimationModifier())
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
