//
//  TextFieldIcon.swift
//  practice
//
//  Created by Vitaliy Petrovskiy on 29.11.21.
//

import SwiftUI

struct TextFieldIcon: View {
    var iconname:String
    @Binding var  currentlyEditing: Bool
    
    var body: some View {
        ZStack{
           
           
            Color("ShadowC")
                .cornerRadius(12)
                .opacity(0.8)
                .blur(radius: 3.0)
        
        }
       
        .overlay(
            ZStack{
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.black, lineWidth: 1)
                    .blendMode(.overlay)
                Image(systemName: iconname)
                    .gradientForeground(colors: [Color("Party"),.black])
                    .font(.system(size:17,weight: .medium))
            }
        )
        .frame(width: 36, height: 36, alignment: .center)
        .padding([.vertical,.leading],0)
    }
}

struct TextFieldIcon_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldIcon(iconname: "key.fill", currentlyEditing: .constant(false))
            .preferredColorScheme(.dark)
    }
}
