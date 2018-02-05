//
//  ProviderService.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 5/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import SwiftyJSON
import PromiseKit
import Alamofire

class ProviderService: NSObject {

    func getServiceData(_ idName: String, idCountry : String, idNumber : String) -> Promise<JSON>{
        
        let format = CONSTANTES.LLAMADA.BASE_URL_APPLE
        let arguments : [CVarArg] = [idCountry, idName, idNumber]
        let urlsString = String(format: format, arguments: arguments)
        let urlRequest = URLRequest(url: URL(string: urlsString)!)
            return Alamofire.request(urlRequest).responseJSON().then{ (data) -> JSON in
            jsonDataGenerico = JSON(data)
            return jsonDataGenerico!
        }
        
    }
    
}
