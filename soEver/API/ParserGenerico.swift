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
        for c_data in (jsonDataGenerico?["feed"]["entry"].arrayValue)! {
            let modelData = GenericModel(json: c_data)
            arrayData.append(modelData)
        }
        completion(arrayData)
    }
}
