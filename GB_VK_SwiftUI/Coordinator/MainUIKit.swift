//
//  MainUIKit.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 17.02.2022.
//

import SwiftUI

struct MainUIKit: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MainCoordinator {
        MainCoordinator()
    }
    
    func updateUIViewController(_ uiViewController: MainCoordinator, context: Context) { }
}

