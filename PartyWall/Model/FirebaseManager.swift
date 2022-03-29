//
//  FirebaseManager.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 9.02.22.
//

import Foundation
import Firebase
class FirebaseManager: NSObject {

    let auth: Auth
    let storage: Storage

    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()

        self.auth = Auth.auth()
        self.storage = Storage.storage()

        super.init()
    }

}
