//
//  PrimaryButton.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 3.02.22.
//

import SwiftUI

struct PrimaryButton: View {
    var image: String?
    var showImage = true
    var text: String
    
    var body: some View {
        HStack {
            if showImage {
                Image(systemName: image ?? "person.fill")
            }
            
            Text(text)
            
        }
        .padding()
        .padding(.horizontal)
        .font(.headline)
        .frame(height: 50)
        .gradientForeground(colors: [Color("Party"),.primary])
        .background(
            Color("ShadowB")
                .opacity(0.8)
        )
        .overlay(RoundedRectangle(cornerRadius: 16.0)
                    .stroke(Color.primary, lineWidth: 1.9)
                    .blendMode(.normal)
                    .opacity(0.7)
        ).cornerRadius(16.0)
      
        
    }
}
