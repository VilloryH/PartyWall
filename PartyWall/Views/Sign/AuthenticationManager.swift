//
//  AuthenticationManager.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 3.02.22.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    @Published private(set) var biometryType: LABiometryType = .none
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription:String?
    @Published var showAlert = false
    private(set) var context = LAContext()
    private(set) var canEvaluatePolicy = false
    
    init() {
        getBiometryType()
    }
    
    func getBiometryType() {
       canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
         
    }
    
   func authenticatedWithBiometrycs() async{
        context = LAContext()
       
       if canEvaluatePolicy {
           let reason = "Login into the app"
           
           do {
              let success =  try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
               
               if success{
                   DispatchQueue.main.async {
                       self.isAuthenticated = true
                   }
               }
               
           }
           catch{
               DispatchQueue.main.async {
                   self.errorDescription = error.localizedDescription
                   self.showAlert = true
                   self.biometryType = .none
               }
           }
           
           
           
       }
       
    }
}
