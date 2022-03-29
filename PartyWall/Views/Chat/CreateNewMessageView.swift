import SDWebImageSwiftUI
import SwiftUI

class CreateNewMessageViewModel: ObservableObject {

    @Published var users = [ProfileUser]()
    @Published var errorMessage = ""

    init() {
        fetchAllUsers()
    }

    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch users: \(error)"
                    print("Failed to fetch users: \(error)")
                    return
                }

                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let user = ProfileUser(data: data)
                    if user.uid != FirebaseManager.shared.auth.currentUser?.uid {
                        self.users.append(.init(data: data))
                    }

                })
            }
    }
}



struct CreateNewMessageView: View {
    @EnvironmentObject var model:Model
   let didSelectNewUser: (ProfileUser) -> ()
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var vm = CreateNewMessageViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
              
                ForEach(vm.users) { user in
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(user)
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .cornerRadius(50)
                                .overlay(RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color(.label), lineWidth: 2)
                                )
                            Text(user.username)
                                .foregroundColor(Color(.label))
                            Spacer()
                        }.padding(.horizontal)
                    }
                    Divider()
                        .padding(.vertical, 8)
                }
            }.navigationTitle("Новое сообщение")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            withAnimation(.closeCard){
                            model.showDetail.toggle()
                            presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            Text("Отмена")
                        }
                    }
                }
        }
    }
}

