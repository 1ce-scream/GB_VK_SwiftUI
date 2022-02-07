//
//  GB_VK_SwiftUIApp.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 22.01.2022.
//

import SwiftUI

@main
struct GB_VK_SwiftUIApp: App {
    
    @State var isLoginComplete: Bool = false
    
    init() {
        configureUiView()
    }
    
    var body: some Scene {
        WindowGroup {
            
            if isLoginComplete {
                MainView()
            } else {
//                LoginScreenView(isLoginComplete: $isLoginComplete)
                LoginWebView(isLoginComplete: $isLoginComplete)
            }
            
        }
    }
    
    private func configureUiView() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(.blue)

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .black
    }
}
