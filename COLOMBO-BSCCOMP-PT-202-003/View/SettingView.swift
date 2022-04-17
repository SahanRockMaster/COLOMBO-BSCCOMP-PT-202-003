//
//  SettingView.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//
//Last Commit
import SwiftUI
import Firebase

struct SettingView: View {
    @StateObject private var settingVM = SettingViewModel()
    @State var visible = false
    @State var isLinkActive = false
    
    var body: some View {
        ZStack{
            ZStack(alignment: .topLeading, content: {
                GeometryReader{_ in
                    ScrollView{
                        LazyVStack{

                          Image("ProfileBG")
                              .resizable()
                              .scaledToFill()
                              .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 3)

                    TextField ("Name", text: self.$settingVM.userDetails.name)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.settingVM.userDetails.name != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 5)

                    TextField ("NIC", text: self.$settingVM.userDetails.nic)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.settingVM.userDetails.nic != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 5)

                    TextField ("Mobile Number", text: self.$settingVM.userDetails.mobile)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.settingVM.userDetails.nic != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 5)

                            TextField ("", text: self.$settingVM.userDetails.email)
                                .padding().foregroundColor(.gray)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(self.settingVM.userDetails.email != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                                )
                                .padding(.top, 5)

                            
                            TextField ("", text: self.$settingVM.userDetails.selectedGender)
                                .padding().foregroundColor(.gray)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(self.settingVM.userDetails.selectedGender != "" ? Color.cyan: Color.cyan.opacity(0.7), lineWidth: 2)
                                )
                                .padding(.top, 5)
                            
                            NavigationLink(destination: HomeView(),isActive: $isLinkActive){
                                Button {
                                    
                                self.isLinkActive = true
                                self.settingVM.logout()
                               
                            }
                            label: {
                                Text("Sign Out")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 50)
                            
                        
                            .background(Color.cyan)
                            .cornerRadius(10)
                            .padding(.top, 1)

                        }

                        }
                    }.padding(.horizontal, 25)
                }
            }
                   
            if self.settingVM.message.alert{
               GeometryReader{_ in
                    ErrorMessagesView(alert: self.$settingVM.message.alert, error: self.$settingVM.message.error, topic: self.$settingVM.message.topic, loading: self.$settingVM.message.isLoading, guestUser: $settingVM.message.guestUser)
               }
            }
        })
                   }
                    .toolbar{
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button {
                                self.settingVM.verify()
                            } label: {
                                Text("Save")
                            
                            }
                        }
                    }
                }
            }
                   
struct SettingView_Previews: PreviewProvider {
   static var previews: some View {
        SettingView()
    }
}

            
