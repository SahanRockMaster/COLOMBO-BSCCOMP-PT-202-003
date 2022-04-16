//
//  SignUpView.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var signUpVM = SignUpViewModel()
    @Environment(\.presentationMode) var present

        var body: some View {
            ZStack{
                ZStack(alignment: .topLeading, content: {
                    GeometryReader{_ in
                        ScrollView{
                            LazyVStack{
                            Text("Sign Up")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black.opacity(0.7))
                                    .padding(.top, 15)
                                
                                TextField ("NIC(ex: 952432109)", text: self.$signUpVM.signup.nic)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(self.signUpVM.signup.nic != "" ? Color.orange: Color.black.opacity(0.7), lineWidth: 2)
                                    )
                                    .padding(.top, 5)
                                
                                TextField("Name", text: self.$signUpVM.signup.name)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(self.signUpVM.signup.name != "" ? Color.orange : Color.black.opacity(0.7), lineWidth: 2)
                                    )
                                    .padding(.top, 10)
                                
                                DatePicker("DOB", selection: $signUpVM.signup.dob, in: signUpVM.closedRange...Date(), displayedComponents: .date)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(self.signUpVM.signup.dob.formatted(date: .long, time: .omitted) != Date.init().formatted(date: .long, time: .omitted) ? Color.orange : Color.black.opacity(0.7), lineWidth: 2)
                                    )
                                    .padding(.top, 10)
                                
                                HStack(spacing: 15){
                                    Text("Select Gender")
                                    Spacer()
                                    Picker("Gender", selection:
                                            $signUpVM.signup.selectedGender) {
                                        ForEach(signUpVM.genderArray, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(self.signUpVM.signup.selectedGender != "Male." ? Color.orange:  Color.black.opacity(0.7), lineWidth: 2)
                                )
                                .padding(.top, 10)
                     
                                
                                TextField("Mobile", text: self.$signUpVM.signup.mobile)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(self.signUpVM.signup.mobile != "" ? Color.orange : Color.black.opacity(0.7), lineWidth: 2)
                                    )
                                    .padding(.top, 10)
                                
                                TextField("Email", text: self.$signUpVM.signup.email)
                                    .textInputAutocapitalization(.never)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(self.signUpVM.signup.email != "" ? Color.orange : Color.black.opacity(0.7), lineWidth: 2)
                                    )
                                    .padding(.top, 10)
                                
                                HStack(spacing: 15){
                                    VStack{
                                        if self.signUpVM.visible{
                                            TextField("Password", text: self.$signUpVM.signup.pass)
                                                .textInputAutocapitalization(.never)
                                        }else {
                                            SecureField("Password", text: self.$signUpVM.signup.pass)
                                                .textInputAutocapitalization(.never)
                                        }
                                    }
                                    
                                    Button {
                                        self.signUpVM.visible.toggle()
                                    } label: {
                                        Image(systemName: self.signUpVM.visible ? "eye.slash.fill" : "eye.fill")
                                            .foregroundColor(Color.orange.opacity(0.7))
                                    }

                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(self.signUpVM.signup.pass != "" ? Color.orange : Color.black.opacity(0.7), lineWidth: 2)
                                )
                                .padding(.top, 10)
                                
                                HStack(spacing: 15){
                                    VStack{
                                        if self.signUpVM.revisible{
                                            TextField("Re-enter Password", text: self.$signUpVM.signup.repass)
                                                .textInputAutocapitalization(.never)
                                        }else {
                                            SecureField("Re-enter Password", text: self.$signUpVM.signup.repass)
                                                .textInputAutocapitalization(.never)
                                        }
                                    }

                                    Button {
                                        self.signUpVM.revisible.toggle()
                                    } label: {
                                        Image(systemName: self.signUpVM.revisible ? "eye.slash.fill" : "eye.fill")
                                            .foregroundColor(Color.orange.opacity(0.7))
                                    }

                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(self.signUpVM.signup.repass != "" ? Color.orange : Color.black.opacity(0.7), lineWidth: 2)
                                )
                                .padding(.top, 10)
                                
                                Button {
                                    signUpVM.verifySignUp()
                                } label: {
                                    Text("Sign Up")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width - 50)
                                }
                                .background(Color.orange)
                                .cornerRadius(10)
                                .padding(.top, 20)

                            }
                            .padding(.horizontal, 25)
                        }
                    }
                
                    Button {
                        self.present.wrappedValue.dismiss()
                    } label: {
                        HStack{
                            Image(systemName: "chevron.left")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(Color.orange)
                            Text("Sign In")
                                .fontWeight(.bold)
                                .foregroundColor(Color.orange)
                        }
                    }
                    .padding()

                })
            }
        
            .navigationBarHidden(true)
        }

    }


struct Previews_SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

