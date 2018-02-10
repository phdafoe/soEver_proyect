//
//  GenericModel.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 5/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GenericModel {
    
    var id : String?
    var name : String?
    var artworkUrl100 : String?
    var kind : String?
    var artistName : String?
    var releaseDate : String?
    var url : String?
    var genres : [Genres]?
    
    init(json : JSON) {
        self.id = dimeString(json, nombre: "id")
        self.name = dimeString(json, nombre: "name")
        self.artworkUrl100 = dimeString(json, nombre: "artworkUrl100").replacingOccurrences(of:"200x200", with:"600x600")
        self.kind = dimeString(json, nombre: "kind")
        self.artistName = dimeString(json, nombre: "artistName")
        self.releaseDate = dimeString(json, nombre: "releaseDate")
        self.url = dimeString(json, nombre: "url")
        self.genres = [Genres.init(json: json["genres"])]
    }
}

struct Genres {
    var name : String?
    var url : String?
    
    init(json : JSON) {
        self.name = dimeString(json, nombre: "name")
        self.url = dimeString(json, nombre: "url")
    }
}
