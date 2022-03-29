//
//  ChatLogView.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 11.02.22.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase


struct FirebaseConstants {
    static let fromId = "fromId"
    static let toId = "toId"
    static let text = "text"
    static let username = "username"
    static let imageUser = "imageUser"
}

struct ChatMessage: Identifiable {

    var id: String { documentId }

    let documentId: String
    let fromId, toId, text, username, imageUser: String

    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.fromId = data[FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[FirebaseConstants.toId] as? String ?? ""
        self.text = data[FirebaseConstants.text] as? String ?? ""
        self.username = data[FirebaseConstants.username] as? String ?? ""
        self.imageUser = data[FirebaseConstants.imageUser] as? String ?? ""
    }
}

class ChatLogViewModel: ObservableObject {
        @Published var chatText = ""
        @Published var errorMessage = ""
        @Published var chatMessages = [ChatMessage]()

        let profileUser: ProfileUser?

        init(profileUser: ProfileUser?) {
            self.profileUser = profileUser
            fetchMessages()
        }
    private func fetchMessages() {
           guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return }
           guard let toId = profileUser?.uid else { return }
      
    
           FirebaseManager.shared.firestore
               .collection("messages")
               .document(fromId)
               .collection(toId)
               .order(by: "timestamp")
               .addSnapshotListener { querySnapshot, error in
                   if let error = error {
                       self.errorMessage = "Failed to listen for messages: \(error)"
                       print(error)
                       return
                   }

                   querySnapshot?.documentChanges.forEach({ change in
                       if change.type == .added {
                           let data = change.document.data()
                           self.chatMessages.append(.init(documentId: change.document.documentID, data: data))
                       }
                   })
                   DispatchQueue.main.async{
                   self.count += 1
                   }
               }
       }
    func handleSend() {
       
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return }

        guard let toId = profileUser?.uid else { return }

        let document = FirebaseManager.shared.firestore.collection("messages")
            .document(fromId)
            .collection(toId)
            .document()

        let messageData = [FirebaseConstants.fromId: fromId, FirebaseConstants.toId: toId, FirebaseConstants.text: self.chatText, "timestamp": Timestamp()] as [String : Any]

        document.setData(messageData) { error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }
          
            self.chatText = ""
            self.count += 1
        }

        let recipientMessageDocument = FirebaseManager.shared.firestore.collection("messages")
            .document(toId)
            .collection(fromId)
            .document()

        recipientMessageDocument.setData(messageData) { error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }

            print("Recipient saved message as well")
        }
    }
    
    @Published var count = 0
    
}

struct ChatLogView: View {

    let profileUser: ProfileUser?
    
    @EnvironmentObject var model:Model

    init (profileUser: ProfileUser?) {
        self.profileUser = profileUser
        self.vm = .init(profileUser: profileUser)
    }
    
    @ObservedObject var vm: ChatLogViewModel
    
    var body: some View {
        ZStack {
            
            messagesView
           
            VStack(spacing: 0) {
                Spacer()
                chatBottomBar
                    .background(Color("ShadowB").ignoresSafeArea())
            }
        }
        .navigationTitle(profileUser?.username ?? "")
            .navigationBarTitleDisplayMode(.inline)
            
            .onDisappear {
                withAnimation(.closeCard){
                model.showDetail.toggle()
                }
            }
    }

    static let emptyScrollToString = "Empty"
    private var messagesView: some View {
       
        VStack {
            ScrollView {
                ScrollViewReader { scrollViewProxy in
                    VStack {
                        ForEach(vm.chatMessages) { message in
                            MessageView(message: message, vm: vm)
                        }

                        HStack{ Spacer() }
                        .id(Self.emptyScrollToString)
                    }
                    .onReceive(vm.$count) { _ in
                        withAnimation(.easeOut(duration: 0.5)) {
                            scrollViewProxy.scrollTo(Self.emptyScrollToString, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("ShadowC"))
            .safeAreaInset(edge: .bottom){
                chatBottomBar
                    .background(Color(.systemBackground).ignoresSafeArea())
        }
        }

    }

    private var chatBottomBar: some View {
        HStack(spacing: 16) {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 24))
                .gradientForeground(colors: [Color("Party"),.black])
            ZStack {
                DescriptionPlaceholder()
                TextEditor(text: $vm.chatText)
                    .opacity(vm.chatText.isEmpty ? 0.5 : 1)
            }
            .frame(height: 40)

            Button {
                vm.handleSend()
            } label: {
                
                Image(systemName: "arrow.up.message.fill")
                    .gradientForeground(colors: [Color("Party"),.black])
                    .font(.system(size:25))
                
            }
   
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

private struct DescriptionPlaceholder: View {
    var body: some View {
        HStack {
            Text("Введите сообщение...")
                .foregroundColor(Color(.gray))
                .font(.system(size: 17))
                .padding(.leading, 5)
                .padding(.top, -4)
            Spacer()
        }
    }
}

    struct MessageView: View {
        
        let message: ChatMessage
        @ObservedObject var vm: ChatLogViewModel
        
        var body: some View{
            VStack{
                if message.fromId == FirebaseManager.shared.auth.currentUser?.uid{
                    HStack {
                        Spacer()
                        HStack {
                            
                            VStack(alignment: .trailing, spacing: 2){
                                
                            Text(message.text)
                                .foregroundColor(.black)
                                
                           
                            }
                        }
                        .padding()
                        .background(Color("Party"))
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                else {
                    HStack {
                       
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 2){
                            Text(vm.profileUser?.username ?? "")
                                    .foregroundColor(.purple)
                            Text(message.text)
                                
                                .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(Color("ShadowA"))
                        .cornerRadius(8)
                        Spacer()
                    }
                   
                }
            } .padding(.horizontal)
                .padding(.top, 8)
          
        }
    }

struct ChatLogView_Previews: PreviewProvider {
    static var previews: some View {
        ChatLogView(profileUser: nil).preferredColorScheme(.dark)
    }
}
