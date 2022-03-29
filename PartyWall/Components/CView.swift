//
//  CView.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 29.01.22.
//

import SwiftUI

struct CView: View {
    var namespace:Namespace.ID
    var partyposter:Partyposter = partyposterdata[0]
    var poster:poster = posterpartydata[0]
    @Binding var show:Bool
    @State var appear = [false,false,false]
    @State var viewState:CGSize = .zero
    @State var isDraggable = true
    @EnvironmentObject var model:Model
   
    var body: some View {
        ZStack {
            ScrollView {
                 cover
                content
                    .offset(y:120)
                    .padding(.bottom,200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .background(Color("ShadowA"))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous))
            .shadow(color: Color("Party").opacity(0.2), radius: 30, x: 0, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isDraggable ? draggesture : nil)
            .ignoresSafeArea()
            xbutton
        }
        .onAppear{
           fadeIn()
        }
        .onChange(of: show){ newValue in
            fadeOut()
        }
    }
    
   
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .global).minY
            VStack {
                Spacer()
               
        }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundStyle(.white)
           
            .background(
                Image(poster.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(poster.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 25)
            )
            .mask(RoundedRectangle(cornerRadius: 30,
                                     style: .continuous)
                .matchedGeometryEffect(id: "mask\(poster.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                  )
            .overlay(
                overlaycontent
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
                    )
        }
        .frame(height:500)
    }
    
    var content:some View{
        
        VStack(alignment: .leading,spacing: 15){
            HStack(alignment: .center, spacing: 11){
                Text("Время: ")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                Text(partyposter.time)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [ Color("Party").opacity(0.5),.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
           
            HStack(alignment: .center, spacing: 45){
                Text("Кто: ")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                Text(partyposter.who)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [ Color("Party").opacity(0.5),.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            HStack(alignment: .top){
                Text("Line up: ")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                VStack(alignment: .leading, spacing: 12){
                    ForEach(partyposter.lineup, id: \.self){
                        line in
                        Text(line)
                            .font(.title2.weight(.bold))
                            .foregroundStyle(.linearGradient(colors: [ Color("Party").opacity(0.5),.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                    }
                   
                }
             
                VStack(alignment: .leading, spacing: 8){
                    ForEach(partyposter.linkstelegr, id: \.self){
                        linktel in
                        Link(destination: URL(string:linktel)!){
                                Image("teleglogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                            
                            }
                        .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius:30,
                                                   style: .continuous))
                )
                    }
                   
                   
                }.padding(.horizontal,30)
              
  
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(partyposter.linksinstagram, id: \.self){
                        linkinst in
                        Link(destination: URL(string:linkinst)!){
                                Image("instlogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                            }
                        .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30,
                                                   style: .continuous))
                          
                        
                )
                    }
                }
                
            }
           
            HStack(alignment: .center, spacing: 45){
                Text("Где: ")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                Text(partyposter.iswhere)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [ Color("Party").opacity(0.5),.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
           
            HStack (alignment: .center, spacing: 15){
                Text("Адрес: ")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                Text(partyposter.adress)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [ Color("Party").opacity(0.5),.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            }
            
            HStack(alignment: .center, spacing: 28){
                Text("Вход: ")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                Text(partyposter.price)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [ Color("Party").opacity(0.5),.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            
            Text(partyposter.ages)
                .font(.title2.weight(.bold))
                .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            


        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        
    }
    
    var overlaycontent:some View {
        
            VStack(alignment: .leading,spacing:15){
                Text(poster.subtitle)
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(poster.id)", in: namespace)
                Text(poster.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(poster.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment:.leading)
                Divider()
                    .opacity(appear[0] ? 1 : 0)
                HStack{
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .cornerRadius(10)
                            .padding(8)
                            .background(.ultraThinMaterial, in:
                                            RoundedRectangle(cornerRadius: 18,style:.continuous))
                    Text(poster.text)
                        .font(.footnote)
                }
                .opacity(appear[1] ? 1 : 0)
            }
                .padding(20)
                .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30,
                                           style: .continuous))
                    .matchedGeometryEffect(id: "blur\(poster.id)", in: namespace)
                
        )
                .offset(y:250)
                .padding(20)
    }
    
    var xbutton:some View {
        Button {
            withAnimation(.closeCard){
                show.toggle()
                model.showDetail.toggle()
            }
        }
    label: {
        Image(systemName: "xmark")
            .font(.body.weight(.bold))
            .foregroundColor(.secondary)
            .padding(8)
            .background(.ultraThinMaterial,in:Circle())
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    .padding(20)
    .ignoresSafeArea()
    }
    
   
    var draggesture:some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged{
                value in
                guard value.translation.width > 0 else {return}
                if value.startLocation.x < 200 {
                    withAnimation(.closeCard){
                        viewState = value.translation
                    }
                 
                }
                if viewState.width > 150 {
                    close()
                }
               
            }
            .onEnded {
                value in
                if viewState.width > 200 {
                    close()
                }
                else {
                    withAnimation(.closeCard){
                    viewState = .zero
                    }
                }
            
           
            }
    }
    
    func fadeIn(){
        withAnimation(.easeOut.delay(0.3)){
        appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)){
        appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)){
        appear[2] = true
        }
    }
    
    func fadeOut(){
       
            appear[0] = false
            appear[1] = false
            appear[2] = false
            
    }
    
    
    func close() {
      
            withAnimation(.closeCard.delay(0.3)){
                show.toggle()
                model.showDetail.toggle()
            }
        
        withAnimation(.closeCard){
        viewState = .zero
        }
        
        isDraggable = false
    }
    
    
}

struct CView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CView(namespace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}
