//
//  ParserGenerico.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 5/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class ParserGenerico: NSObject {
    
    func getGenericParser(_ completion : @escaping (_ arrayData : [GenericModel]) -> ()){
        var arrayData = [GenericModel]()
        for c_data in (jsonDataGenerico?["feed"]["results"].arrayValue)! {
            let modelData = GenericModel(json: c_data)
            arrayData.append(modelData)
        }
        completion(arrayData)
    }
    
    func getGenresParser(_ completion : @escaping (_ arrayGenres : [Genres]) -> ()){
        var arrayGenres = [Genres]()
        for c_genre in (jsonDataGenerico?["genres"].arrayValue)!{
            let modelData = Genres(json: c_genre)
            arrayGenres.append(modelData)
        }
        completion(arrayGenres)
    }
    
    
}
