//
//  posterModel.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 7.12.21.
//

import SwiftUI

struct poster: Identifiable {
    let id = UUID()
    var title: String
    var subtitle:String
    var text:String
    var image:String
}

var posterdata = [
    poster(title: "Пятница", subtitle: "01.01.2022", text: "SometextOne", image: "image-1"),
    poster(title: "Суббота", subtitle: "02.01.2022", text: "SometextTwo", image: "image-2"),
    poster(title: "Воскресенье", subtitle: "03.01.2022", text: "SometextThree", image: "image-3")
]
var posterpartydata = [
    poster(title: "Джус1", subtitle: "01.01.2022", text: "SometextOne", image: "image-2"),
    poster(title: "Туса2", subtitle: "02.01.2022", text: "SometextTwo", image: "image-1"),
    poster(title: "Туса3", subtitle: "03.01.2022", text: "SometextThree", image: "image-3")
]

var posterpartydata1 = [
    poster(title: "Туса4", subtitle: "01.01.2022", text: "SometextOne", image: "image-3"),
    poster(title: "Туса5", subtitle: "02.01.2022", text: "SometextTwo", image: "image-1"),
    poster(title: "Туса6", subtitle: "03.01.2022", text: "SometextThree", image: "image-2")
]

var posterpartydata2 = [
    poster(title: "Туса7", subtitle: "01.01.2022", text: "SometextOne", image: "image-2"),
    poster(title: "Туса8", subtitle: "02.01.2022", text: "SometextTwo", image: "image-3"),
    poster(title: "Туса9", subtitle: "03.01.2022", text: "SometextThree", image: "image-1")
]

