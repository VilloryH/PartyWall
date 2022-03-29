//
//  AccountView.swift
//  practice
//
//  Created by Vitaliy Petrovskiy on 22.11.21.
//

import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI



struct AccountView: View {
    @State private var showAlertView: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user:UserStore
    @ObservedObject private var profilevm = AccountViewModel()
    
    var body: some View {
        NavigationView{
            List{
                VStack(spacing: 8){
                   
                    WebImage(url: URL(string: profilevm.profileUser?.profileImageUrl ?? "" ))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 128, height: 128)
                        .cornerRadius(64)
                        
                    
                  let profileuserName = profilevm.profileUser?.username
                    Text( profileuserName ?? "")
                        .font(.title.weight(.semibold))
                    HStack{
                        Image(systemName: "location")
                            .imageScale(.large)
                        Text("На какой тусе")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Section{
                    NavigationLink {HomeView()} label:{
                    Label("Настройки", systemImage: "gear")
                        
                    }
                    NavigationLink {HomeView() } label:{
                        Label("Сотрудничество", systemImage: "creditcard")
                    }
                    NavigationLink{HomeView()} label: {
                        Label("Помощь",systemImage: "questionmark")
                    }
                    
                }.accentColor(.primary)
                    .listRowSeparatorTint(.blue)
                    .listRowSeparator(.hidden)
                
                Link(destination: URL(string:"https://apple.com")!){
                    HStack {
                        Label("Social sites", systemImage: "safari")
                            .accentColor(.primary)
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }.swipeActions{
                    Button(action: {}){
                        Label("Delete",systemImage: "trash")
                    }.tint(.red)
                }
                Button(action: {signout()}, label: {
                    HStack{
                    Image(systemName: "arrowshape.turn.up.backward")
                        .accentColor(.red)
                    Text("Выйти")
                            .foregroundColor(.red).padding(.horizontal,10)
                    }
                })
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Профиль")
        }
        .alert(isPresented: $showAlertView) {
               Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
           }
       
    }
    func signout() {
        do {
            try FirebaseManager.shared.auth.signOut()
            presentationMode.wrappedValue.dismiss()
            UserDefaults.standard.set(false, forKey: "isLogged")
            self.user.isLogged = false
        } catch let error {
            alertTitle = "Uh-Oh!"
            alertMessage = error.localizedDescription
            showAlertView.toggle()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountView()
            AccountView()
                .preferredColorScheme(.dark)
        }
    }
}
