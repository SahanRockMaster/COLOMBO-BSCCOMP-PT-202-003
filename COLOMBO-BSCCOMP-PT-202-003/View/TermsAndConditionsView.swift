//
//  TermsAndConditionsView.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-16.
//

import SwiftUI

struct TermsAndConditionsView: View {
    var body: some View {
        VStack{
            VStack(spacing: 100){
                Text("NIBM Broker IOS APP").font(.title).foregroundColor(.blue).bold()
              VStack(spacing: 20){
                Text("Terms & Conditions").font(.title).foregroundColor(.blue).bold()
                  Text("Buying and selling is a famous marketing in Sri Lanka. Because of that, another opportunity has arisen as a broker. Since we don’t have a legal framework, which is properly in action today, that will lead the real buyer and real seller in a difficult situation. In This app, you can connect with real sellers.").multilineTextAlignment(.center).lineSpacing(7)
            }.padding(.horizontal,20)
                Text("Developed By Sahan Ruwanga").bold().padding(.bottom)
                
                
           Spacer()
            
        }
       
        
        }
        
    }
}


struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditionsView()
    }
}

