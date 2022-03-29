//
//  UserStore.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 8.02.22.
//

import Foundation
import Combine

class UserStore: ObservableObject {
    @Published var isLogged:Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = true
}
