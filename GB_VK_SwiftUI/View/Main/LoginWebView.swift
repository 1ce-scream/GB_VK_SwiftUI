//
//  LoginWebView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 06.02.2022.
//

import Foundation
import SwiftUI
import WebKit
import Combine
import UIKit


struct LoginWebView: UIViewRepresentable {
    
    @Binding var isLoginComplete: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        
        let preference = WKPreferences()
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preference
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = NetworkService.makeAuthURLRequest()
        uiView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: LoginWebView
        var webViewNavigationSubscriber: AnyCancellable? = nil
        
        init(_ webView: LoginWebView) {
            self.parent = webView
        }
        
        deinit {
            webViewNavigationSubscriber?.cancel()
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            
            
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                decisionHandler(.allow)
                return
            }
            
            let params = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, param in
                    var dict = result
                    let key = param[0]
                    let value = param[1]
                    dict[key] = value
                    return dict
                }
            guard let token = params["access_token"],
                  let userId = params["user_id"] else {
                      decisionHandler(.allow)
                      return
                  }
            
            Session.shared.token = token
            Session.shared.userID = Int(userId)
            
            
            print("token = \(token)  userId = \(userId)")
            parent.isLoginComplete = true
            decisionHandler(.cancel)
        }
    }
}
