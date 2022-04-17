//
//  SignInView.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//

import SwiftUI


struct SignInView: View{
@StateObject var signInVM = SignInViewModel()
@State var visible = false
    //@State var isActive: Bool = false

var body: some View {
    ZStack{
        
        ZStack(alignment: .topTrailing, content: {
            GeometryReader{_ in
                ScrollView(.vertical, showsIndicators: false) {
                
                    VStack{
                        Image("SignInBG")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 3)
                        

                        Text("Sign In into your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black.opacity(0.7))
                        Spacer()
                        TextField("Email", text: self.$signInVM.signing.email)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(self.signInVM.signing.email != "" ? Color(.cyan) : Color.cyan.opacity(0.7), lineWidth: 2)
                            )
                            .padding(.top, 25)
                        HStack(spacing: 15) {
                            VStack{
                                if self.visible{
                                    TextField("Password", text: self.$signInVM.signing.pass)
                                        .textInputAutocapitalization(.never)
                                }else {
                                    SecureField("Password", text: self.$signInVM.signing.pass)
                                        .textInputAutocapitalization(.never)
                                }
                            }
                            
                            Button {
                                self.visible.toggle()
                            } label: {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(Color.cyan.opacity(0.7))
                            }

                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.signInVM.signing.pass != "" ? Color(.cyan) : Color.cyan.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 25)
                        

                        
                        HStack{
                            Spacer()
                            NavigationLink {
                                ForgetPassword()
                            } label: {
                                Text("Forgot Password")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.cyan)
                            }
                        }
                        .padding(.trailing,9).padding(.top, 50)
                        
                        VStack{
                            Spacer()
                            NavigationLink {
                                TermsAndConditionsView()
                            } label: {
                                Text("Terms & Conditions")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.cyan)
                            }
                        }.padding(.trailing,166).padding(.top,-42)

//                        NavigationLink("",destination: SignUpModel(email: email), isActive: {
                        Button {
                            signInVM.verify()
//                            self.isActive.toggle()
                                //self.selection = 1
                            
                        } label: {
                            Text("Agree & Sign In")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color.cyan)
                        .cornerRadius(10)
                        .padding(.top, 1)
                        
                   
//                                Button {
//                           // self.advertisementVM.userLatitude = "\(locationManager.userLati)"
//                            //self.advertisementVM.userLongitude = "\(locationManager.userLong)"
//                            self.signInVM.validation()
//                                } label: {
//                                    Text("Post Ads")
//                                }

                    }
                    .padding(.horizontal, 25)
                }

            }
            
            NavigationLink {
                SignUpView()
            } label: {
                Text("Sign Up")
                    .fontWeight(.bold)
                    .foregroundColor(Color.cyan)
            }
            .padding()
           })

         if self.signInVM.message.alert{
                    GeometryReader{_ in
                        ErrorMessagesView(alert: self.$signInVM.message.alert, error: self.$signInVM.message.error, topic: self.$signInVM.message.topic, loading: self.$signInVM.message.isLoading, guestUser: self.$signInVM.message.guestUser)

            }
        }
    }
}

    

 


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
  }
}

                    
