//
//  SignUpViewModel.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//
//Last Commit

import Foundation
import SwiftUI
import Firebase
//import FirebaseStorage

class SignUpViewModel: ObservableObject {
    @Published var signup = SignUpModel(nic: "", name: "", dob: Date(), selectedGender: "Male.", mobile: "", email: "", pass: "", repass: "")
    @Published var message = ErrorMessageModel(alert: false, error: "", topic: "Error", isLoading: false, guestUser: false)
    @Published var genderArray = ["Male", "Female", "Other"]
    @Published var closedRange = Calendar.current.date(byAdding: .year, value: -120, to: Date())!
    @Published var visible = false
    @Published var revisible = false
    @AppStorage("current_status") var status = false

    let ref = Firestore.firestore()
    
    
    func verifySignUp(){
  
        if self.signup.nic != "" && self.signup.name != "" && self.signup.dob.formatted(date: .long, time: .omitted) != Date.init().formatted(date: .long, time: .omitted) && self.signup.selectedGender != "Male." && self.signup.mobile != "" && self.signup.email != "" && self.signup.pass != "" && self.signup.repass != "" {
            if self.signup.nic.isValidNIC{
                if  self.signup.mobile.isValidContact {
                    if self.signup.pass == self.signup.repass {
                        createNewAccount()
                    }else{
                            self.message.error = "Password mismatch"
                            self.message.alert.toggle()
                    }
                }else{
                    self.message.error = "Invalid Phone Number"
                    self.message.alert.toggle()
                }
            }else{
                self.message.error = "Invalid NIC ID"
                self.message.alert.toggle()
            }
        } else {
            self.message.error = "Please Fill the all the Fields properly"
            self.message.alert.toggle()
        }
    }

    
    func createNewAccount(){
        self.message.alert.toggle()
        self.message.isLoading = true
        Auth.auth().createUser(withEmail: self.signup.email, password: self.signup.pass) { (res , err)  in
            if err != nil {
                self.message.isLoading = false
                self.message.error = err!.localizedDescription
            }else{
                let uid = res?.user.uid
                self.ref.collection("Users").document(uid!).setData([
                    "uid" : uid,
                    "nic" : self.signup.nic,
                    "name" :self.signup.name,
                    "dob" : self.signup.dob.formatted(date: .long, time: .omitted),
                    "gender" : self.signup.selectedGender,
                    "mobile" : self.signup.mobile,
                    "email" : self.signup.email,
                    "dateCreated" : Date.init()
                    
                ]) { (err) in
                    if err != nil {
                        self.message.isLoading = false
                        self.message.error = err!.localizedDescription
                    }else{
                        self.message.isLoading = false
                        self.message.topic = "Success"
                        self.message.error = "Sign Up Successfully"
                        self.signup = SignUpModel(nic: "", name: "", dob: Date(), selectedGender: "Male.", mobile: "", email: "", pass: "", repass: "")
                    }
                }
            }
        }
    }
}





