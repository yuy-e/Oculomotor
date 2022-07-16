//
//  LoginView.swift
//  Oculomotor (iOS)
//
//  Created by xg on 7/14/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var isPresented: Bool = false
    @State var isActive: Bool = false
    @ObservedObject private var loginVM = LoginViewModel()
    
    var body: some View {
        
        ZStack{
            
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack{
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                
                
                SocalLoginButtonView(image: Image(uiImage: #imageLiteral(resourceName: "apple")), text: Text("Sign in with Apple"))
                
                SocalLoginButtonView(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google").foregroundColor(Color("LoginPrimaryColor")))
                    .padding(.vertical)
                
                Text("or login with password")
                    .foregroundColor(Color.black.opacity(0.4))
                
                TextField("Email address", text: $loginVM.email)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                
                SecureField("Password", text: $loginVM.password)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                    .padding(.vertical)
                
                
                PrimaryButtonView(title: "Login", backgroundColor: Color("LoginPrimaryColor"), fontColor: Color.white) {
                    loginVM.login {
                        isActive = true
                    }
                }

                PrimaryButtonView(title: "Register", backgroundColor: Color.white, fontColor: Color.black) {
                    isPresented = true
                }
                
                
                NavigationLink(
                    destination: ContentView(),
                    isActive: $isActive,
                    label: {
                        EmptyView()
                    })
                
            }
            .padding()
            .sheet(isPresented: $isPresented, content: {
                RegisterView()
            })
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
