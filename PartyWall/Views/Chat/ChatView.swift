import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ChatView: View {
    @EnvironmentObject var user:UserStore
    @ObservedObject private var profilevm = AccountViewModel()
    @State private var shouldNavigateToChatLogView = false
    @EnvironmentObject var model:Model

    private var customNavBar: some View {
        HStack(spacing: 16) {

            WebImage(url: URL(string: profilevm.profileUser?.profileImageUrl ?? "" ))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(64)

            VStack(alignment: .leading, spacing: 4) {
                let profileuserName = profilevm.profileUser?.username
                Text(profileuserName ?? "")
                    .font(.system(size: 24, weight: .bold))

                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("online")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.lightGray))
                }

            }

            Spacer()
            Button {
               
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
       
    }
    
    

    var body: some View {
        NavigationView {

            VStack {
               
                messagesView
                NavigationLink("", isActive: $shouldNavigateToChatLogView) {
                                   ChatLogView(profileUser: self.profileUser)
                               }
            }
            .overlay(
                newMessageButton, alignment: .bottomTrailing)
            .navigationBarHidden(true)
          
        }
    }

    private var messagesView: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                VStack {
                    NavigationLink(destination: {
                        Text("Here")
                    }, label: {
                        HStack(spacing: 16) {
                            Image(systemName: "person.fill")
                                .font(.system(size: 32))
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 44)
                                            .stroke(Color(.label), lineWidth: 1)
                                )


                            VStack(alignment: .leading) {
                                Text("Username")
                                    .font(.system(size: 16, weight: .bold))
                                    .gradientForeground(colors: [Color("Party"),Color("ShadowC")])
                                Text("Message sent to user")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(.lightGray))
                            }
                            Spacer()

                            Text("22d")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    })
                    
                    Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)

            }.padding(.bottom, 50)
        }
    }
@State var shouldShowNewMessageScreen = false
  
    private var newMessageButton: some View {
        Button {
            withAnimation(.openCard){
            model.showDetail.toggle()
            shouldShowNewMessageScreen.toggle()
            }
        } label: {
            HStack {
               
                Image(systemName: "plus.message.fill")
                    .gradientForeground(colors: [Color("Party"),.black])
                    .font(.system(size:40,weight: .medium))
            }
            .padding(.all, 5)
            .overlay(RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.primary, lineWidth: 1.9)
                        .blendMode(.normal)
                        .opacity(0.7))
            .background(Color("ShadowC")
                            .cornerRadius(16).opacity(0.7))
            .padding(.vertical,60)
            .padding(.horizontal)
            .foregroundColor(.primary)
            
        }
        .fullScreenCover(isPresented: $shouldShowNewMessageScreen){
            CreateNewMessageView(didSelectNewUser: {user in print(user.email)
               
                self.shouldNavigateToChatLogView.toggle()
                self.profileUser = user
            })
        }
    }
    @State var profileUser: ProfileUser?
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView().preferredColorScheme(.dark)
    }
}

