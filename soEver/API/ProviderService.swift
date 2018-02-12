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

    @available(*, deprecated, message : "data not complete only in topmovie")
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
    
    func getServiceData(_ idCountry : String, idFirstPath : String, idSecondPath : String, idNumber : String) -> Promise<JSON>{
        let format = CONSTANTES.LLAMADA.BASE_URL_APPLE_2018
        let arguments : [CVarArg] = [idCountry, idFirstPath, idSecondPath, idNumber]
        let urlString = String(format: format, arguments: arguments)
        let urlRequest = URLRequest(url: URL(string: urlString)!)
        return Alamofire.request(urlRequest).responseJSON().then(execute: { (data) -> JSON in
            jsonDataGenerico = JSON(data)
            return jsonDataGenerico!
        })
        
    }
    
}





