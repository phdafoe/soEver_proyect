//
//  ReuseIdentifier.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 31/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import UIKit

public protocol ReuseIdentifierInterface : class{
    static var defaultIdentifier : String {get}
}

public extension ReuseIdentifierInterface where Self : UIView{
    static var defaultIdentifier : String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

