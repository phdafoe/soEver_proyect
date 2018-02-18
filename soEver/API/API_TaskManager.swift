//
//  API_TaskManager.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 13/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

class APiTaskManager{
    
    static let shared = APiTaskManager()
    
    var fotoPost : arrayDictionay = [[:]]
    var descripcionText : arrayDictionay = [[:]]
    
    func salvarDatos (){
        CONSTANTES.NSUSERDEFAULT.USER_DEFAULT.set(fotoPost, forKey: CONSTANTES.NSUSERDEFAULT.KEY_IMAGE_POST)
        CONSTANTES.NSUSERDEFAULT.USER_DEFAULT.set(descripcionText, forKey: CONSTANTES.NSUSERDEFAULT.KEY_DESCRIP_POST)
        CONSTANTES.NSUSERDEFAULT.USER_DEFAULT.synchronize()
    }
    
    func cargarDatos(){
      
        if let myArrayImagenes = CONSTANTES.NSUSERDEFAULT.USER_DEFAULT.array(forKey: CONSTANTES.NSUSERDEFAULT.KEY_IMAGE_POST) as? arrayDictionay{
            fotoPost = myArrayImagenes
        }
        
        if let myArraydescripcion = CONSTANTES.NSUSERDEFAULT.USER_DEFAULT.array(forKey: CONSTANTES.NSUSERDEFAULT.KEY_DESCRIP_POST) as? arrayDictionay{
            descripcionText = myArraydescripcion
        }
    }
    
    
    
    
    
    
    
    
}
