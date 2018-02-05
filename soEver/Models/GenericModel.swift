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
    var title : String?
    var summary : String?
    var image : String?
    var category : String?
    var director : String?
    var releaseDate : String?
    var rentalPrice : String?
    var link : String?
    
    init(json : JSON) {
        self.id = dimeString(json["id"]["attributes"], nombre: "im:id")
        self.title = dimeString(json["im:name"], nombre: "label")
        self.summary = dimeString(json["summary"], nombre: "label")
        self.image = dimeString(json["im:image"][2], nombre: "label").replacingOccurrences(of:"170x170", with:"500x500")
        self.category = dimeString(json["category"]["attributes"], nombre: "label")
        self.director = dimeString(json["im:artist"], nombre: "label")
        self.releaseDate = dimeString(json["im:releaseDate"], nombre: "label")
        self.rentalPrice = dimeString(json["im:price"], nombre: "label")
        self.link = dimeString(json["link"][0]["attributes"], nombre: "href")
    }
}
