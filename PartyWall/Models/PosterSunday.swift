//
//  PosterSunday.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 9.12.21.
//

import SwiftUI

struct posterSunday: Identifiable {
    let id = UUID()
    var time:String
    var who:String
    var Lineup:String
    var place:String
    var adress:String
    var price:String
    var ages:String
    
}

var sundaydata = [
posterSunday(time: "23:00", who: "DSDSFFFF", Lineup: "Какие то пилоры", place: "Догма что ли", adress: "Где то на ок 16", price: "15",ages: "54+"),
posterSunday(time: "23:00", who: "MECHTA", Lineup: "Какие то пилоры", place: "Догма что ли", adress: "Где то на ок 16", price: "15", ages: "54+"),
posterSunday(time: "15:00", who: "Детсад", Lineup: "Какие то пилоры", place: "Догма что ли", adress: "Где то на ок 16",price: "15", ages: "54+"),
posterSunday(time: "23:00", who: "DADA", Lineup: "Какие то пилоры", place: "Догма что ли", adress: "Где то на ок 16", price: "15",ages: "54+")
]
