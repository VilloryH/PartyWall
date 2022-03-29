//
//  SuccessView.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 6.02.22.
//

import SwiftUI

struct SuccessView: View {
    @State var show = false
    var body: some View {
        withAnimation(.linear(duration: 0.5)){
        VStack {
            withAnimation(.linear(duration: 0.5)){
            Text("Входим...").font(.title).bold()
                .opacity(show ? 1 : 0)
               
            }
            withAnimation(.linear(duration: 1).delay(0.4)){
            LottieView(filename: "success")
                .frame(width: 300, height: 200)
                .opacity(show ? 1 : 0)
            }
        }
        .padding(.top,20)
        .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 30,style: .continuous))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color("Party").opacity(0.2), radius: 30, x: 0, y: 30)
        .scaleEffect(show ? 1 : 0.5)
        
        .onAppear {
            withAnimation(.linear(duration: 1).delay(0.4)){
            self.show = true
        }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(show ? 0.5 : 0))
       
        .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
