//
//  ContentView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 03.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoginComplete = false
    
    var body: some View {
        NavigationView {
            HStack {
                
                LoginScreenView(isLoginComplete: $isLoginComplete)
                
                NavigationLink(
                    destination: MainView(),
                    isActive: self.$isLoginComplete,
                    label: {
                        EmptyView()
                    })
                
            }
            .navigationBarHidden(true)
        }
    }
}
