//
//  FirebaseManager.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 9.02.22.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class FirebaseManager: NSObject {

    let auth: Auth
    let storage: Storage
    let firestore:Firestore
    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()

        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()

        super.init()
    }

}
