//
//  PartyView.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 3.02.22.
//

import SwiftUI

struct PartyView: View {
    @State var hasScrolled = false
    @State var showProfile = false
    @State var show = false
    @State var showStatusBar = true
    @Namespace var namespace
    @State var selectedID = UUID()
    @State var selectedDay = []
    @EnvironmentObject var model:Model

    var body: some View {
      
        ZStack {
            
            Color("ShadowA").ignoresSafeArea()
            VStack{
            ScrollView {
            

                if !show{
                    ForEach(posterpartydata) { poster in
                        CItem(namespace: namespace,poster: poster, show: $show)
                            .onTapGesture{
                                withAnimation(.openCard ){
                                    show.toggle()
                                    model.showDetail.toggle()
                                    showStatusBar = false
                                    selectedID = poster.id
                                }
                        }
                    }
                }
                else {
                    ForEach(posterpartydata) { poster in
                        Rectangle()
                            .fill(.white)
                            .frame(height:300)
                            .cornerRadius(30)
                            .opacity(0.3)
                        .padding(.horizontal,30)
                    }
                    
                }
                }
        }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavBar(title:"Let's go", hasScrolled: $hasScrolled)
                    
        )
            if show{
                ForEach(posterpartydata) { poster in
                    if poster.id == selectedID {
                        CView(namespace: namespace, poster: poster, show: $show)
                            .zIndex(1)
                            .transition(.asymmetric(
                                insertion: .opacity.animation(.easeInOut(duration:0.1)),
                            removal: .opacity.animation(.easeInOut(duration:0.3).delay(0.2))))
                    }
                }
         
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show){newValue in
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                if newValue {
                    showStatusBar = false
                }
                else {
                    showStatusBar = true
                }
            }
           
        }
    }
   
    }


struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView(selectedDay: partyposterdata)
    }
}
