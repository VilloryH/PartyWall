//
//  FridayItem.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 9.12.21.
//

import SwiftUI

struct FridayItem: View {
    var posterFriday:posterFriday = fridaydata[0]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0){
           Spacer()
            
           
            Text(posterFriday.time)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("Кто: \(posterFriday.who)")
                
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text("Line up: \(posterFriday.Lineup)")
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("Где: \(posterFriday.place)")
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text(posterFriday.adress)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("Вход: \(posterFriday.price) BYN")
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text(posterFriday.ages)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
          
           
            Text("@Party Wall")
                .font(.caption2)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
        
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30,
                                 style: .continuous))
       
       
       
        
    .padding(.horizontal, 20)
    }
}

struct FridayItem_Previews: PreviewProvider {
    static var previews: some View {
        FridayItem()
            .preferredColorScheme(.dark)
    }
}
