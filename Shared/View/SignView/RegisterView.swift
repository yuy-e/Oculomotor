//
//  RegisterView.swift
//  Oculomotor (iOS)
//
//  Created by xg on 7/14/22.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject private var registerVM = RegisterViewModel()
    
    var body: some View {
        VStack {
            Image("register")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all, 20)
            
            TextField("Email", text: $registerVM.email)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $registerVM.password)
            
            Button("Create account") {
               
                registerVM.register {
                    presentationMode.wrappedValue.dismiss()
                }
                
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Register")
        .embedInNavigationView()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
