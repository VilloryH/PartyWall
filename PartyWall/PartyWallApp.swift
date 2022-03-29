//
//  PartyWallApp.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 30.11.21.
//

import SwiftUI
import Firebase

@main
struct PartyWallApp: App {
  
    
    
    @StateObject var model = Model()
    @StateObject var user = UserStore()
  //  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
   
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
                .environmentObject(user)
        }
    }
}

/*class AppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Fire.....")
        FirebaseApp.configure()
        return true
    }
}
 */
