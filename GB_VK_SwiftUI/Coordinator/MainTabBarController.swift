//
//  MainTabBarController.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 17.02.2022.
//

import UIKit
import SwiftUI

struct MainTabBar: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UITabBarController()
        controller.viewControllers = controllers
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
        uiViewController.tabBarController?.setViewControllers(
            controllers,
            animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITabBarControllerDelegate {
        var mainTabBar: MainTabBar
        
        init(_ tabBarController: MainTabBar) {
            mainTabBar = tabBarController
        }
    }
}

struct TabBarElementItem {
    var title: String
    var systemImageName: String
}

protocol TabBarElementView: View {
    associatedtype Content
    
    var content: Content { get set }
    var tabBarElementItem: TabBarElementItem { get set }
}

struct TabBarElement: TabBarElementView {
    internal var content: AnyView
    
    var tabBarElementItem: TabBarElementItem
    
    init<Content: View>(tabBarElementItem: TabBarElementItem,
    @ViewBuilder _ content: () -> Content) {
        self.tabBarElementItem = tabBarElementItem
        self.content = AnyView(content())
    }
    
    var body: some View { self.content }
}

struct UITabBarWrapper: View {
    var controllers: [UIHostingController<TabBarElement>]
    
    init(_ elements: [TabBarElement]) {
        self.controllers = elements.enumerated().map {
            let hostingController = UIHostingController(rootView: $1)
            
            hostingController.tabBarItem = UITabBarItem(
                title: $1.tabBarElementItem.title,
                image: UIImage.init(
                    systemName: $1.tabBarElementItem.systemImageName),
                tag: $0
            )
            
            return hostingController
        }
    }
    
    var body: some View {
        MainTabBar(controllers: self.controllers)
    }
}
