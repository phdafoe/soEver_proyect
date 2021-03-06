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


/// <#Description#>
///
/// - Returns: <#return value description#>
public func randomIdNumber() -> String{
    let arrayNumber = 1 + Int(arc4random_uniform(100))
    return "\(arrayNumber)"
}


/// <#Description#>
///
/// - Returns: <#return value description#>
public func randomIdCountry() -> String{
    var arraCountr = ["es", "us", "fr", "it"]
    print("Original: \(arraCountr)")
    arraCountr.shuffle()
    return arraCountr.first!
}

/// <#Description#>
///
/// - Returns: <#return value description#>
public func randomLorem() -> String{
    var arrayLorem = ["Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
                      "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)",
                      "Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo", "Muchos paquetes de autoedición y editores de páginas web usan el Lorem Ipsum como su texto por defecto, y al hacer una búsqueda de `Lorem Ipsum' va a dar por resultado muchos sitios web que usan este texto si se encuentran en estado de desarrollo. Muchas versiones han evolucionado a través de los años, algunas veces por accidente, otras veces a propósito (por ejemplo insertándole humor y cosas por el estilo).",
                      "Al contrario del pensamiento popular, el texto de Lorem Ipsum no es simplemente texto aleatorio. Tiene sus raices en una pieza cl´sica de la literatura del Latin, que data del año 45 antes de Cristo, haciendo que este adquiera mas de 2000",
                      "Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de 'de Finnibus Bonorum et Malorum' (Los Extremos del Bien y El Mal) por Cicero, escrito en el año 45 antes de Cristo. Este libro es un tratado de teoría de éticas, muy popular durante el Renacimiento. La primera linea del Lorem Ipsum, 'Lorem ipsum dolor sit amet..', viene de una linea en la sección 1.10.32"]
    
    print("Original: \(arrayLorem)")
    arrayLorem.shuffle()
    return arrayLorem.first!
}




/// <#Description#>
///
/// - Parameters:
///   - myTitle: <#myTitle description#>
///   - myMessage: <#myMessage description#>
///   - array: <#array description#>
/// - Returns: <#return value description#>
public func muestraAlertController (_ myTitle : String, myMessage : String, array : [UIAlertAction]?) -> UIAlertController{
    let alert = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    return alert
}

// MARK: - extension array
extension Array {
    mutating func shuffle() {
        for _ in indices {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}













