//
//  AppleButton.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 4.02.22.
//

import SwiftUI
import AuthenticationServices

struct AppleButton:UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}
