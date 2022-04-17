//
//  SignInViewModel.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//
//Last Commit
import SwiftUI
import Firebase
import FirebaseAuth

class SignInViewModel: ObservableObject {
    //@State private var showingPaymentAlert = true
    @Published var signing = SignInModel(email: "", pass: "")
    @Published var message = ErrorMessageModel(alert: false, error: "", topic: "Error", isLoading: false, guestUser: false)
    @AppStorage("current_status") var status = true
    let defaults = UserDefaults.standard
    
    func verify(){
        //print("sahan")
        
        if self.signing.email != "" && self.signing.pass != "" {
            signInWithEmail();
//            showingPaymentAlert.toggle()
//                .alert(isPresented: $showingPaymentAlert) {
//                    Alert(title: Text("Order confirmed"), message: Text("Your thank you!"), dismissButton: .default(Text("OK")))
////                    Button("Confirm order") {
//
//                    }
//                }
////            Alert(
////                title: Text("Success"),
////                message: Text("XXFUll"),
////                dismissButton: .default(Text("OKk"))
////                )
////           print("sahan")
            
   
        
        }
        else {
            self.message.error = "Please Fill the all the Fields properly"
            //self.message.error = "Advertisement Uploaded Successfully"
            self.message.alert.toggle()
        }
    }
    
    func signInWithEmail(){
        self.message.isLoading = true
        self.message.alert.toggle()
        Auth.auth().signIn(withEmail: self.signing.email, password: self.signing.pass) { (res , err)  in
            if err != nil {
                self.message.isLoading = false
                //self.message.topic = "Success"
//                self.message.error = "Account Created Successfully"
                self.message.error = err!.localizedDescription
               // self.message.error = "Account Created Successfully"
            }else{
                
                fetchUser() { userDetails in
                    self.message.isLoading = false
                    self.message.topic = "Success"
                    self.message.error = "Signed In Successfully.. Please Back to Home"
                    self.defaults.setValue(userDetails.mobile, forKey: "userMobile")
                    self.defaults.setValue(userDetails.nic, forKey: "userNIC")
                    self.defaults.setValue(userDetails.name, forKey: "userName")
                    self.defaults.setValue(userDetails.dob, forKey: "userDOB")
                    self.defaults.setValue(userDetails.email, forKey: "userEmail")
                    self.defaults.setValue(userDetails.gender, forKey: "userGender")
                    //self.message.alert.toggle()
//                    self.message.isLoading = false
//                    self.message.topic = "Success"
//                    self.message.error = "Account Created Successfully"
                    self.status = false
                }


            }
        }
    }
    
}
