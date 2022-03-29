//
//  PartyNameModel.swift
//  PartyWall
//
//  Created by Vitaliy Petrovskiy on 29.01.22.
//

import Foundation
struct Partyposter: Identifiable {
    let id = UUID()
    var time:String
    var who:String
    var lineup:[String]
    var linkstelegr:[String]
    var linksinstagram:[String]
    var iswhere:String
    var adress:String
    var price:String
    var ages:String
  
}

var partyposterdata = [
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+")
]

var partyposterdata1 = [
    Partyposter(time: "23:00", who: "СубботаE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+")
]

var partyposterdata2 = [
    Partyposter(time: "23:00", who: "Воскеес", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+"),
    Partyposter(time: "23:00", who: "MAD MOUSE", lineup: ["MAD MOUSE", "HATSKIP", "MAKLAI", "MAGIC", "OUTER SPACE"],linkstelegr: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"], linksinstagram: ["https://apple.com","https://google.ru","https://belgazprombank.by","https://instagram.com","https://zoo.by"],iswhere: "HIDE", adress: ("ул. Октябрьская 19, Минск"), price: "5/10 BYN", ages: "18+")
]
