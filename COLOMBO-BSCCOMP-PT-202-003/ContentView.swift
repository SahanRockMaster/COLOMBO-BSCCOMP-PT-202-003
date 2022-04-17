//
//  ContentView.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-06.
//

import SwiftUI
struct ContentView: View {
    @AppStorage("current_status") var status = false
    
    var body: some View {
        NavigationView{
            if status{
                HomeView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
