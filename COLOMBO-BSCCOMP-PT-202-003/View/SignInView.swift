//
//  SignInView.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//

import SwiftUI

struct SignInView: View {
    
    func ZStack(){
      ZStack(alignment: .topTrailing, content: {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack({
                                Text("Log into your account")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black.opacity(0.7))
                                TextField("Email").padding(.top, 10)
                                .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .Color("Color"),Color.black.opacity(0.7), lineWidth: 2)
                                    
                                .padding(.top, 25);){
                                HStack(spacing: 15){
                                    VStack{
                                       
                                            TextField("Password")
                                                .textInputAutocapitalization(.never)
                                  
                                        }
                                    }
                               
                            }()

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
  }
}
                                   
                            

                    
