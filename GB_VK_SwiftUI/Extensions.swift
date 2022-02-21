//
//  Extensions.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

extension View {
    func statusColorModifier(status: Status) -> some View {
        self.modifier(StatusColorModifier(status: status))
    }
    
    func avatarTapAnimationModifier() -> some View {
        self.modifier(AvatarTapAnimationModifier())
    }
    
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
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
