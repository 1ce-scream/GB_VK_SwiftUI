//
//  ContentView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 22.01.2022.
//

import SwiftUI
import Combine

struct LoginScreenView: View {
// MARK: - Private properties
    
    @State private var offset: CGFloat = 0
    @State private var login = ""
    @State private var password = ""
    @State private var isUserCredsAlertShow = false
    @State private var isLoginComplete = false
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true},
        NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillHideNotification)
            .map { _ in false}
    )
        .removeDuplicates()
    
// MARK: - Body
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                
                LogoView()
                
                ScrollView {
                    VStack() {
                        
                        Spacer()
                        
                        TextFieldsView(login: $login,
                                       password: $password)
                       
                        ButtonsView(loginText: login,
                                    passwordText: password,
                                    offset: $offset,
                                    isUserCredsAlertShow: $isUserCredsAlertShow,
                                    isLoginComplete: $isLoginComplete)
                            .onReceive(keyboardIsOnPublisher) { _ in
                                self.offset = changeOffsetForKeyboard(
                                    height: geometry.size.height)
                            }
                    }
                    .modifier(MainStackViewModifier(
                        maxWidth: geometry.size.width,
                        maxHeight: geometry.size.height))
                }
            }
        }
        .background(.blue)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .alert(isPresented: $isUserCredsAlertShow, content: {
            Alert(title: Text("Incorrect user creds"),
                  message: Text("Incorrect login or password"),
                  dismissButton: .cancel())
        })
    }

// MARK: - Private functions
    
    private func changeOffsetForKeyboard(height: CGFloat) -> CGFloat {
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

//MARK: - View Modifiers



// MARK: - Views

struct LogoView: View {
    var body: some View {
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
    }
}

struct ButtonsView: View {
    var loginText: String
    var passwordText: String
    @Binding var offset: CGFloat
    @Binding var isUserCredsAlertShow: Bool
    @Binding var isLoginComplete: Bool
    
    var body: some View {
        HStack() {
            Group {
                Button("Sign in", action: self.verifyUserCredentials)
                    .disabled(loginText.isEmpty || passwordText.isEmpty)
                
                Button("Register", action: didTapRegister)
                
            } .modifier(ButtonsViewModifier(
                offset: offset))
        }
    }
    
    private func verifyUserCredentials() {
        if loginText == "Root" && passwordText == "toor" {
            self.isLoginComplete = true
        } else {
            self.isUserCredsAlertShow = true
        }
    }
    
    func didTapRegister() {
        print("Register button was tapped")
    }
}

struct TextFieldsView: View {
    @Binding var login: String
    @Binding var password: String
    
    var body: some View {
        Group {
            TextField("Login", text: $login)
            SecureField("Password", text: $password)
        }
        .frame(width: 160)
        .textFieldStyle(.roundedBorder)
    }
}

// MARK: - Extensions

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}


// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        LoginScreenView()
            .previewInterfaceOrientation(.portrait)
    }
}
