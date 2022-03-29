//
//  PosterBetaModel.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 8.12.21.
//

import SwiftUI

struct posterBeta: Identifiable {
    let id = UUID()
    var title: String
    var name:String
    var date:String
   
}

var posterBetadata = [
posterBeta(title: "тусовка1", name: "название1", date: "01.01.2001"),
posterBeta(title: "тусовка2", name: "название2", date: "01.01.2002"),
posterBeta(title: "тусовка3", name: "название3", date: "01.01.2003"),
posterBeta(title: "тусовка4", name: "название4", date: "01.01.2004")

]
