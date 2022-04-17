//
//  SettingViewModel.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//
//Last Commit
import Foundation
import Firebase
import SwiftUI

class SettingViewModel: ObservableObject {
    @AppStorage("current_status") var status = true
    @Published var message = ErrorMessageModel(alert: false, error: "", topic: "Error", isLoading: true, guestUser: false)
    @Published var userDetails = SignUpModel(nic: "", name: "", dob: Date(), selectedGender: "Male.", mobile: "", email: "", pass: "", repass: "")
    
    let defaults = UserDefaults.standard
    let ref = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    init(){
        initialization()
    }
    
    func verify(){
  
        if self.userDetails.nic != "" && self.userDetails.name != ""  && self.userDetails.mobile != "" {
            if self.userDetails.nic.isValidNIC{
                if  self.userDetails.mobile.isValidContact {
                    updateUserDetails()
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
    
    func updateUserDetails(){
        ref.collection("Users").document(uid).updateData([
            "nic": self.userDetails.nic,
            "name": self.userDetails.name,
            "mobile": self.userDetails.mobile
        ]){ (err) in
            if err != nil { return}
            self.saveObjects()
        }
    }
    
    func initialization(){
        userDetails.mobile = defaults.string(forKey: "userMobile") ?? ""
        userDetails.nic = defaults.string(forKey: "userNIC") ?? ""
        userDetails.name = defaults.string(forKey: "userName") ?? ""
        userDetails.email = defaults.string(forKey: "userEmail") ?? ""
        userDetails.selectedGender = defaults.string(forKey: "userGender") ?? ""
    }
    
    func logout(){
        self.message.isLoading = true
        //self.message.topic = "Success"
        self.message.error = "Signned out Successfully"
        self.defaults.removeObject(forKey: "userMobile")
        self.defaults.removeObject(forKey: "userNIC")
        self.defaults.removeObject(forKey: "userName")
        self.defaults.removeObject(forKey: "userDOB")
        self.defaults.removeObject(forKey: "userEmail")
        self.defaults.removeObject(forKey: "userGender")
        self.defaults.removeObject(forKey: "province")
        try! Auth.auth().signOut()
        self.status = false
    }
    
//    func logout(){
//        self.message.isLoading = true
//        self.message.alert.toggle()
//
////        self.message.isLoading = true
////        self.message.topic = "Success"
////        self.message.error = "Signned out Successfully"
//        self.defaults.removeObject(forKey: "userMobile")
//        self.defaults.removeObject(forKey: "userNIC")
//        self.defaults.removeObject(forKey: "userName")
//        self.defaults.removeObject(forKey: "userDOB")
//        self.defaults.removeObject(forKey: "userEmail")
//        self.defaults.removeObject(forKey: "userGender")
//        self.defaults.removeObject(forKey: "province")
//        self.message.isLoading = false
//        self.message.topic = "Success"
//        self.message.error = "Signned out Successfully"
//        try! Auth.auth().signOut.(err) in
//        if err != nil {
//            self.message.isLoading = false
//            self.message.error = err!.localizedDescription
//        }else{
//
//        self.message.isLoading = false
//        self.message.topic = "Success"
//        self.message.error = "Signned out Successfully"
//        }
//        }
//    }
    
//        self.message.isLoading = true
//        self.message.topic = "Success"
//        self.message.error = "Signned out Successfully"
//        self.status = false
//        self.message.isLoading = false
//        self.message.topic = "Success"
//        self.message.error = "Signned out Successfully"
    
//    { (err) in
//        if err != nil {
//            self.message.isLoading = false
//            self.message.error = err!.localizedDescription
//        }else{
//                    self.message.isLoading = false
//                    self.message.topic = "Success"
//                    self.message.error = "Signned out Successfully"
//        }
//
//    }

    func saveObjects(){
        self.defaults.removeObject(forKey: "userNIC")
        self.defaults.removeObject(forKey: "userName")
        self.defaults.removeObject(forKey: "userMobile")
        fetchUser() { userDetails in
            self.message.alert.toggle()
            self.message.topic = "Success"
            self.message.error = "Profile Details Updated Successfully"
            self.defaults.setValue(userDetails.nic, forKey: "userNIC")
            self.defaults.setValue(userDetails.name, forKey: "userName")
            self.defaults.setValue(userDetails.mobile, forKey: "userMobile")
        }
        
    }
}


