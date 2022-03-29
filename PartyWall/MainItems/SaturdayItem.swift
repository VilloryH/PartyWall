//
//  SaturdayItem.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 9.12.21.
//

import SwiftUI

struct SaturdayItem: View {
    var posterSaturday:posterSaturday = saturdaydata[0]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0){
           Spacer()
            
           
            Text(posterSaturday.time)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("Кто: \(posterSaturday.who)")
                
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text("Line up: \(posterSaturday.Lineup)")
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("Где: \(posterSaturday.place)")
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text(posterSaturday.adress)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("Вход: \(posterSaturday.price) BYN")
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text(posterSaturday.ages)
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

struct SaturdayItem_Previews: PreviewProvider {
    static var previews: some View {
        SaturdayItem()
    }
}
