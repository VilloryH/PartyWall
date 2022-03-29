

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    @State var show = false
    @State var showStatusBar = true
    @State var showProfile = false
    @Namespace var namespace
    @State var selectedID = UUID()
    @State var selectedDay = "Пятница"
    @EnvironmentObject var model:Model

    var body: some View {
        ZStack {
            
            Color("ShadowA").ignoresSafeArea()
            
            VStack{
            ScrollView {
                scrollDetection
                featured
                
                Text(selectedDay)
                   
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                
                if selectedDay == "Пятница" {
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
                
                if selectedDay == "Суббота" {
                
                if !show{
                    ForEach(posterpartydata1) { poster in
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
                    ForEach(posterpartydata1) { poster in
                        Rectangle()
                            .fill(.white)
                            .frame(height:300)
                            .cornerRadius(30)
                            .opacity(0.3)
                        .padding(.horizontal,30)
                    }
                    
                }
                
                }
                
                if selectedDay == "Воскресенье" {
                
                if !show{
                    ForEach(posterpartydata2) { poster in
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
                    ForEach(posterpartydata2) { poster in
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
        }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavBar(title:"Let's go", hasScrolled: $hasScrolled)
                    
        )
            
            if selectedDay == "Пятница" {
            if show{
                ForEach(posterpartydata) { poster in
                    if poster.id == selectedID {
                        CView(namespace: namespace,poster: poster, show: $show)
                            .zIndex(1)
                            .transition(.asymmetric(
                                insertion: .opacity.animation(.easeInOut(duration:0.1)),
                            removal: .opacity.animation(.easeInOut(duration:0.3).delay(0.2))))
                    }
                }
         
            }
            }
            
            if selectedDay == "Суббота" {
            if show{
                ForEach(posterpartydata1) { poster in
                    if poster.id == selectedID {
                        CView(namespace: namespace,poster: poster, show: $show)
                            .zIndex(1)
                            .transition(.asymmetric(
                                insertion: .opacity.animation(.easeInOut(duration:0.1)),
                            removal: .opacity.animation(.easeInOut(duration:0.3).delay(0.2))))
                    }
                }
         
            }
            }
            
            if selectedDay == "Воскресенье" {
            if show{
                ForEach(posterpartydata2) { poster in
                    if poster.id == selectedID {
                        CView(namespace: namespace,poster: poster, show: $show)
                            .zIndex(1)
                            .transition(.asymmetric(
                                insertion: .opacity.animation(.easeInOut(duration:0.1)),
                            removal: .opacity.animation(.easeInOut(duration:0.3).delay(0.2))))
                    }
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
    var scrollDetection:some View {
        GeometryReader{ proxy in
            Color.clear.preference(key:ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height:0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: {value in
            withAnimation(.easeInOut){
                if value < 0{
                    hasScrolled = true
                }
                    else {
                        hasScrolled = false
                        
                    }
            }
            
            
        })
    }
    
    var featured:some View {
        TabView{
            ForEach(posterdata) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeatureItem(poster: item)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .blur(radius: abs(minX / 40))
                        .overlay(
                         
                                    Image(item.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 230)
                                        .offset(x: minX / 2, y: -80)
                                        
                            
                        )
                        .onTapGesture {
                            selectedDay = item.title
                            
                              
                                 
                        }
                }
            }
           
        }
        
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height:430)
        .background(
        Image("PartyLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
         
            
        )
        
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(Model())
           
    }
}
