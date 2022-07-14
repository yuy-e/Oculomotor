//
//  WelcomeScreenView.swift
//  Oculomotor (iOS)
//
//  Created by xg on 7/14/22.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationView {
            ZStack{
                //Setup background
                Color("BgColor").edgesIgnoringSafeArea(.all)
                
                VStack{
                    Spacer()
                    Image("onboard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 45.0)
                    Spacer()
                    
                    LoginPrimaryButtonView(title: "Get Started", backgroundColor: Color("LoginPrimaryColor"), fontColor: Color.white)
                    
                    NavigationLink(destination: LoginView().navigationBarHidden(true), label: {
                            LoginPrimaryButtonView(title: "Sign In", backgroundColor: Color.white, fontColor: Color("LoginPrimaryColor"))
                            .padding(.vertical)
                    })
                    
                    
                    HStack{
                        Text("New around here? ")
                        Text("Register")
                            .foregroundColor(Color("LoginPrimaryColor"))
                    }
                    
                }
                .padding()
            }
        }
       
    }
    
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
