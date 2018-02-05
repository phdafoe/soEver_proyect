//
//  API_HELPERS.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 5/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit


/// public func dimeString(_ json: JSON, nombre : String) -> String
///
/// - Parameters:
///   - json: _ json: JSON
///   - nombre: nombre : String
/// - Returns: -> String
public func dimeString(_ json: JSON, nombre : String) -> String{
    if let stringResult = json[nombre].string{
        return stringResult
    }else{
        return ""
    }
}
