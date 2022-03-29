//
//  TabBar.swift
//  practice
//
//  Created by Vitaliy Petrovskiy on 25.11.21.
//

import SwiftUI



struct TabBar: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    //@State var color: Color = .teal
    @State var tabItemWidth:CGFloat = 0
    var body: some View {
        HStack{
            buttons
        }
        .padding(.horizontal, 8)
        .padding(.top,14)
        .frame(height:88, alignment: .top)
        .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 34,style: .continuous))
        .background (
      backgroundCircle
    )
        .overlay (
       overlaydefis
    )
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    var buttons: some View {
        ForEach(tabItems) { item in
            Button{
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                    selectedTab = item.tab
                    //color = item.color
                }
            } label: {
                VStack(spacing: 0){
                Image(systemName: item.icon)
                    .symbolVariant(.fill)
                    .font(.body.bold())
                    .frame(width: 44, height: 29)
                Text(item.text)
                    .font(.body)
                    .lineLimit(1)
            }
                .frame(maxWidth: .infinity)
            }.foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
                .blendMode(selectedTab == item.tab ? .overlay : .normal)
                .overlay(
                    GeometryReader{
                        proxy in
                        Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                    }
                )
                .onPreferenceChange(TabPreferenceKey.self){
                    value in
                    tabItemWidth = value
                }
        
        }
    }
    var backgroundCircle: some View {
        HStack{
            if selectedTab == .profile {Spacer()}
            if selectedTab == .chat {
                Spacer()
                Spacer()
                Spacer()
            }
       
            if selectedTab == .map {Spacer()}
            
            Circle().fill(Color("Party")).frame(width:tabItemWidth)
            if selectedTab == .map {
                Spacer()
                Spacer()
                Spacer()
            }
            if selectedTab == .chat {Spacer()}
            if selectedTab == .home {Spacer()}
        }.padding(.horizontal, 8)
    }
    
    var overlaydefis: some View {
        HStack{
            if selectedTab == .profile {Spacer()}
            if selectedTab == .chat {
                Spacer()
                Spacer()
                Spacer()
            }
       
            if selectedTab == .map {Spacer()}
            Rectangle().fill(Color("Party")).frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
               
            if selectedTab == .map {
                Spacer()
                Spacer()
                Spacer()
            }
            if selectedTab == .chat {Spacer()}
            if selectedTab == .home {Spacer()}
        }.padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
    }
}
