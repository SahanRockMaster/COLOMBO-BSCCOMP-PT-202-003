//
//  COLOMBO_BSCCOMP_PT_202_003App.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-06.
//

import SwiftUI
import Firebase

@main
struct COLOMBO_BSCCOMP_PT_202_003App: App {
    

    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: {url in
                    Auth.auth().canHandle(url)
                })
        }
    }
}

class Appdelegate : NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    // FIrebase URL also impleted inside this
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}
