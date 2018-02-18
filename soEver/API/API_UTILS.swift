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
var diccionarioImagenes = [String : UIImage?]()
var imagenSeleccionada : UIImage?
typealias arrayDictionay = [[String : Any]]

struct Constantes {
    let COLORES = Colores()
    let LLAMADA = Llamadas()
    let ARGUMENTOS = Argumentos()
    let NSUSERDEFAULT = CustomUserDefault ()
}

struct Colores {
    let COLOR_NAV_TAB = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let COLOR_TEXT_NAV = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

struct Llamadas {
    let BASE_URL_APPLE = "https://itunes.apple.com/%@/rss/%@/limit=%@/json"
    let BASE_URL_APPLE_2018 = "https://rss.itunes.apple.com/api/v1/%@/%@/%@/all/%@/explicit.json"
}

struct Argumentos {
    let APPS_IOS_FIRST_PATH = "ios-apps"
    let APPS_IOS_SECOND_PATH = "new-apps-we-love"
    let BOOKS_FIRST_PATH = "books"
    let BOOKS_SECOND_PATH = "top-free"
    let MOVIES_FIRST_PATH = "movies"
    let MOVIES_SECOND_PATH = "top-movies"
    let VIDEOS_FIRST_PATH = "music-videos"
    let VIDEOS_SECOND_PATH = "top-music-videos"
}

struct CustomUserDefault {
    let USER_DEFAULT = UserDefaults.standard
    let KEY_DESCRIP_POST = "descripcion"
    let KEY_IMAGE_POST = "imagen"
}












