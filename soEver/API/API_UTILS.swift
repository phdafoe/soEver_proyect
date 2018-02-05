//
//  API_UTILS.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 5/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

let CONSTANTES = Constantes()
var jsonDataGenerico : JSON?

struct Constantes {
    let COLORES = Colores()
    let LLAMADA = Llamadas()
}

struct Colores {
    let COLOR_NAV_TAB = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let COLOR_TEXT_NAV = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

struct Llamadas {
    let BASE_URL_APPLE = "https://itunes.apple.com/%@/rss/%@/limit=%@/json"
    //let LAST_PATH_COMPONENT = "/limit=50/json"
}
