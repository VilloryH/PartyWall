//
//  Tabs.swift
//  practice
//
//  Created by Vitaliy Petrovskiy on 25.11.21.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable{
    var id = UUID()
    var text:String
    var icon:String
    var tab:Tab
    var color: Color
}

var tabItems = [
    TabItem(text:"Home",icon: "house",tab: .home, color: .teal),
    TabItem(text: "Map", icon: "map", tab: .map, color: .red),
    TabItem(text: "NFC", icon: "figure.stand.line.dotted.figure.stand",tab:.nfc, color: .yellow),
    TabItem(text: "Chat", icon: "bubble.right", tab: .chat, color: .green),
    TabItem(text: "Profile", icon: "person", tab: .profile, color: .purple)
    
]

enum Tab:String{
    case home
    case map
    case nfc
    case chat
    case profile
}

struct TabPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
