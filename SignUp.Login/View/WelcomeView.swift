//
//  WelcomeView.swift
//  SignUp.Login
//
//  Created by Flama Henkel on 27.01.24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email", text:$email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                .frame(width: 350, height: 1)
                .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                .frame(width: 350, height: 1)
                .foregroundColor(.white)
                
                Button{
                    //
                } label: {
                    Text("Login ->")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.yellow, .red], startPoint: .bottomTrailing, endPoint: .topLeading))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
                
                Button(action: {}, label: {
                    HStack {
                        Text("Don't have an account?")
                            .fontWeight(.medium)
                        .foregroundColor(.white)
                        Text("Sign up")
                            .fontWeight(.heavy)
                        .foregroundColor(.white)
                    }
                })
                .padding(.top)
                .offset(y: 110)
                
            }
            .frame(width: 350)
                
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment ) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
            
        }
}
