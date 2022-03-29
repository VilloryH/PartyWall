
import SwiftUI

struct posterAlpha: Identifiable {
    let id = UUID()
    var title: String
    var name:String
    var date:String
   
}

var posterAlphadata = [
posterAlpha(title: "тусовка1", name: "название1", date: "01.01.2001"),
posterAlpha(title: "тусовка2", name: "название2", date: "01.01.2002"),
posterAlpha(title: "тусовка3", name: "название3", date: "01.01.2003"),
posterAlpha(title: "тусовка4", name: "название4", date: "01.01.2004")

]
