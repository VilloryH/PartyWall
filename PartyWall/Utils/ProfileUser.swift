//
//  ProfileUser.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 9.02.22.
//

import Foundation
import SDWebImageSwiftUI

struct ProfileUser: Identifiable {
    
    var id: String {uid}
    
    let uid, email, profileImageUrl, username, city: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.city = data["city"] as? String ?? ""
    }
}

class AccountViewModel: ObservableObject {

    @Published var errorMessage = ""
    @Published var profileUser: ProfileUser?

    init() {
        fetchCurrentUser()
    }

    private func fetchCurrentUser() {

        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }

        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }

            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return

            }
           
            self.profileUser = ProfileUser(data: data)
        }
    }

}
