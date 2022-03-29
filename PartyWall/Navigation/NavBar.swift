//
//  NavBar.swift
//  practice
//
//  Created by Vitaliy Petrovskiy on 25.11.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NavBar: View {
    var title = ""
    @Binding var hasScrolled:Bool
    @EnvironmentObject var user:UserStore
    @ObservedObject private var profilevm = AccountViewModel()
    
    
    
    var body: some View {
        ZStack{
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
                Text(title)
                .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
    .font(.system(size:hasScrolled ? 22 :32))
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.leading, 20)
    .padding(.top, 20)
    .offset(y:hasScrolled ? -4 : 0)
            HStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.bold))
                    .frame(width: 36, height: 36)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in:
                                RoundedRectangle(cornerRadius: 14,style:.continuous))
                let profileImage = profilevm.profileUser?.profileImageUrl
                
                if  profileImage != nil {
                    Button(action: {}, label: {
                WebImage(url: URL(string: profileImage ?? "" ))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .cornerRadius(14)
                    .padding(8)
                   
                    })
                }
                else{
                    Button(action: {}) {
                        Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .cornerRadius(10)
                                .padding(8)
                                .background(.ultraThinMaterial, in:
                                                RoundedRectangle(cornerRadius: 18,style:.continuous))
                    }
                
                }
                
              
                   
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing,20)
            .padding(.top, 20)
            .offset(y:hasScrolled ? -4 : 0)
                
             }
        .frame(height:hasScrolled ? 44 : 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}
