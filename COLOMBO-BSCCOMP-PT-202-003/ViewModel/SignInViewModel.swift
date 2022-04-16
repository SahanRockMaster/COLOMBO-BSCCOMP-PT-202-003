//
//  SignInViewModel.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//

import SwiftUI
import Firebase
import FirebaseAuth

class SignInViewModel: ObservableObject {
    @Published var signing = SignInModel(email: "", pass: "")
    @Published var message = ErrorMessageModel(alert: false, error: "", topic: "Error", isLoading: false, guestUser: false)
    @AppStorage("current_status") var status = true
    let defaults = UserDefaults.standard
    
    func verify(){
        if self.signing.email != "" && self.signing.pass != "" {
            signInWithEmail();
        } else {
            self.message.error = "Please Fill the all the Fields properly"
            self.message.alert.toggle()
        }
    }
    
    func signInWithEmail(){
        self.message.alert.toggle()
        self.message.isLoading = true
        Auth.auth().signIn(withEmail: self.signing.email, password: self.signing.pass) { (res , err)  in
            if err != nil {
                self.message.isLoading = false
                self.message.error = err!.localizedDescription
            }else{
                
                fetchUser() { userDetails in
                    self.defaults.setValue(userDetails.mobile, forKey: "userMobile")
                    self.defaults.setValue(userDetails.nic, forKey: "userNIC")
                    self.defaults.setValue(userDetails.name, forKey: "userName")
                    self.defaults.setValue(userDetails.dob, forKey: "userDOB")
                    self.defaults.setValue(userDetails.email, forKey: "userEmail")
                    self.defaults.setValue(userDetails.gender, forKey: "userGender")
                    self.message.alert.toggle()
                    self.message.isLoading = false
                    self.status = false
                }

            }
        }
    }
    
}
