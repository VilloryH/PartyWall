//
//  PreferenceKey.swift
//  practice
//
//  Created by Vitaliy Petrovskiy on 27.11.21.
//

import SwiftUI

struct ScrollPreferenceKey:PreferenceKey {
    static var defaultValue:CGFloat = 0
    

    static func reduce(value: inout CGFloat, nextValue: () ->  CGFloat){
        value = nextValue()
    }
}
