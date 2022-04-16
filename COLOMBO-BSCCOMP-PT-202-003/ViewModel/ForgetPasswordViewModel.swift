//
//  ForgetPasswordViewModel.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//

import Foundation
import Firebase

class ForgetPasswordViewModel: ObservableObject {
    @Published var login = SignInModel(email: "", pass: "")
    @Published var message = ErrorMessageModel(alert: false, error: "", topic: "Error", isLoading: false, guestUser: false)
    
    func verifyResetPassword(){
        if self.login.email != "" {
            self.resetPassword()
        }else{
            self.message.error = "Email ID is Empty"
            self.message.alert.toggle()
        }
    }

    
    func resetPassword(){
        Auth.auth().sendPasswordReset(withEmail: self.login.email) { (err) in
            if err != nil {
                self.message.error = err!.localizedDescription
                self.message.alert.toggle()
                return
            }else{
                self.message.topic = "Information"
                self.message.error = "Password Reset Link has been sent successfully."
                self.message.alert.toggle()
            }
        }
    }
}
