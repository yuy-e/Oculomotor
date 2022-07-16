//
//  RegisterViewModel.swift
//  Oculomotor (iOS)
//
//  Created by xg on 7/14/22.
//

import Foundation
import Firebase

class RegisterViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    
    func register(completion: @escaping () -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion()
            }
            
        }
        
    }
    
}
