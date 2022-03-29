//
//  ContentView.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 30.11.21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model:Model
    @EnvironmentObject var user:UserStore
    @EnvironmentObject var authenticationManager:AuthenticationManager
    @State var profileUser: ProfileUser?
    var body: some View {
        
       

       if !user.isLogged {
            ZStack {
                SignInView().environmentObject(user)
               }
            
      }
        else {
        ZStack(alignment: .bottom){
          
            switch selectedTab {
            case .home:
                HomeView()
            case .map:
                SignInView()
            case .nfc:
                AccountView()
            case .chat:
                ChatView()
            case .profile:
                AccountView()
            
            }
           
          TabBar()
                .offset(y: model.showDetail ? 200 : 0)
        }.safeAreaInset(edge: .bottom){
            Color.clear.frame(height: 44)}
    }
       
    }
      
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(Model())
            .environmentObject(UserStore())
    }
        
}
