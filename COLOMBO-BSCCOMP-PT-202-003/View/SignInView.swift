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

var body: some View {
    ZStack{
        
        ZStack(alignment: .topTrailing, content: {
            GeometryReader{_ in
                ScrollView(.vertical, showsIndicators: false) {
                
                    VStack{
                        

                        Text("Sign In into your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black.opacity(0.7)).padding(.top, 100)
                        Spacer()
                        TextField("Email", text: self.$signInVM.login.email)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(self.signInVM.login.email != "" ? Color("Color") : Color.black.opacity(0.7), lineWidth: 2)
                            )
                            .padding(.top, 25)
                        HStack(spacing: 15) {
                            VStack{
                                if self.visible{
                                    TextField("Password", text: self.$signInVM.login.pass)
                                        .textInputAutocapitalization(.never)
                                }else {
                                    SecureField("Password", text: self.$signInVM.login.pass)
                                        .textInputAutocapitalization(.never)
                                }
                            }
                            
                            Button {
                                self.visible.toggle()
                            } label: {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(Color.orange.opacity(0.7))
                            }

                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(self.signInVM.login.pass != "" ? Color("Color") : Color.black.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.top, 25)
                        
                        HStack{
                            Spacer()
                            NavigationLink {
                                ForgetPassword()
                            } label: {
                                Text("Forgot Password")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.orange)
                            }
                        }
                        .padding(.top, 20)
                        
                        Button {
                            signInVM.verify()
                        } label: {
                            Text("Sign In")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.top, 25)

                    }
                    .padding(.horizontal, 25)
                }

            }
            
            NavigationLink {
                SignUpView()
            } label: {
                Text("Sign Up")
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
            }
            .padding()

            
        })
        

            }
        }
    }

// }
//
//}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
  }
                                   
                            

                    
