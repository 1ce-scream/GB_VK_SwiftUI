//
//  ContentView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 22.01.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var offset: CGFloat = 0
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true},
        NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillHideNotification)
            .map { _ in false}
    )
        .removeDuplicates()
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                HStack {
                    Image("vk-logo3")
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    Text("ВКонтакте")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding([.top, .leading], 10.0)
                
                ScrollView {
                    VStack() {
                        Spacer()
                        
                        TextField("Login", text: $login)
                            .frame(maxWidth: 160)
                            .textFieldStyle(.roundedBorder)
                        
                        SecureField("Password", text: $password)
                            .frame(width: 160)
                            .textFieldStyle(.roundedBorder)
                        HStack() {
                            Button("Sign in", action: didTapSignIn)
                                .modifier(LoginScreenButtonsViewModifier(
                                    offset: offset))
                                .disabled(login.isEmpty || password.isEmpty)
                            Button("Register", action: didTapRegister)
                                .modifier(LoginScreenButtonsViewModifier(
                                    offset: offset))
                            
                        }.onReceive(keyboardIsOnPublisher) { _ in
                            self.offset = changeOffsetForKeyboard(
                                height: geometry.size.height)
                        }
                    }
                    .frame(minWidth: 0,
                           maxWidth: geometry.size.width,
                           minHeight: 0,
                           maxHeight: geometry.size.height,
                           alignment: .center)
                    .padding(.top, 120.0)
                }
            }
        }
        .background(.blue)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
    
    func didTapSignIn() {
        print("Sign in button was tapped")
    }
    
    func didTapRegister() {
        print("Register button was tapped")
    }
    
    func changeOffsetForKeyboard(height: CGFloat) -> CGFloat {
//        let bottomInset = UIApplication.shared
//            .windows.first?.safeAreaInsets.bottom
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let bottomInset = window?.safeAreaInsets.bottom
        let offsetDivider: CGFloat = 2
        
        let tmpOffset = (
            height - (bottomInset ?? 0)
        ) / offsetDivider
        
        return tmpOffset
    }
}

struct LoginScreenButtonsViewModifier: ViewModifier {
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

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
