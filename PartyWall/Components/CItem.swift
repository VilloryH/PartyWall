//
//  CItem.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 29.01.22.
//

import SwiftUI

struct CItem: View {
    var namespace:Namespace.ID
    var poster:poster = posterpartydata[0]
    @Binding var show:Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading,spacing:12) {
                Text(poster.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(poster.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment:.leading)
                Text(poster.subtitle)
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(poster.id)", in: namespace)
            }
            .padding(20)
            .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30,
                                       style: .continuous))
                .blur(radius: 30)
                .matchedGeometryEffect(id: "blur\(poster.id)", in: namespace)
            
    )
           
           
        }
       
        .foregroundStyle(.white)
      
        .background(
            Image(poster.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(poster.id)", in: namespace)
        )
       
        .mask(RoundedRectangle(cornerRadius: 30,
                                 style: .continuous)
                .matchedGeometryEffect(id: "mask\(poster.id)", in: namespace))
        
        .frame(height:300)
        .padding(20)
    }
}
