//
//  LoginViewModel.swift
//  Oculomotor (iOS)
//
//  Created by xg on 7/14/22.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login(completion: @escaping ()-> Void){
        Firebase.Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
            if let error = error{
                print("Auth Failure:" + error.localizedDescription)
            }else{
                print("Login Success")
                completion()
            }
        }
    }
}
