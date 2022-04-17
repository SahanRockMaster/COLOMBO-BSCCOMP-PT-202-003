//
//  SettingView.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//

import SwiftUI
import Firebase

struct SettingView: View {
    @StateObject private var settingVM = SettingViewModel()
    @State var visible = false
    
    var body: some View {
        ZStack{
            ZStack(alignment: .topLeading, content: {
                GeometryReader{_ in
                    ScrollView{
                        LazyVStack{
//                Section(header:
                            Text("Personal Infromation")
//                    TextField("Name", text: $settingVM.userDetails.name).textInputAutocapitalization(.never)
                    TextField ("Name", text: self.$settingVM.userDetails.name)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.settingVM.userDetails.name != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 5)
//                    TextField("NIC", text: $settingVM.userDetails.nic).textInputAutocapitalization(.never)
                    TextField ("NIC", text: self.$settingVM.userDetails.name)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.settingVM.userDetails.nic != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 5)
//                    TextField("Mobile Number", text: $settingVM.userDetails.mobile).textInputAutocapitalization(.never)
                    TextField ("Mobile Number", text: self.$settingVM.userDetails.mobile)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.settingVM.userDetails.nic != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 5)
//                    Text(settingVM.userDetails.email).foregroundColor(.gray)
                    Text(settingVM.userDetails.email)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.settingVM.userDetails.email != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 5)
                            Text(settingVM.userDetails.selectedGender)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(self.settingVM.userDetails.selectedGender != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                                )
                                .padding()
                                .padding(.top, 5)
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 4)
//                                .fill(self.settingVM.userDetails.selectedGender != "" ? Color.cyan: Color.cyan.opacity(0.7))
//                        )
//                        .padding(.top, 5)
//                    Text(settingVM.userDetails.selectedGender).foregroundColor(.gray)
                

//             Text("Action"){
                    Button {
                        self.settingVM.logout()
                    } label: {
                        Text("Log out")
                            .foregroundColor(.red)
                    }
             
                        
//            }
//        }
            if self.settingVM.message.alert{
               GeometryReader{_ in
                    ErrorMessagesView(alert: self.$settingVM.message.alert, error: self.$settingVM.message.error, topic: self.$settingVM.message.topic, loading: self.$settingVM.message.isLoading, guestUser: $settingVM.message.guestUser)
               }
            }
        }
                
                   Button {
                    self.settingVM.verify()
                } label: {
                    Text("Save")
                }

            }
        }
    
        })
            }
        
    }
}
//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//      }
//    }

            
