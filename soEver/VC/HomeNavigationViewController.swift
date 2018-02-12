//
//  HomeNavigationViewController.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 12/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class HomeNavigationViewController: UINavigationController {
    
    //MARK: - properties
    let botonFlotante = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iPhoneX = UIScreen.main.bounds.height
        
        botonFlotante.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 64.0, height: 64.0))
        botonFlotante.setImage(#imageLiteral(resourceName: "boton_Menu_MiPerfil"), for: .normal)
        
        if iPhoneX == 812{
            botonFlotante.center = CGPoint(x: self.view.bounds.width - 42.0, y: self.view.bounds.height - 150)
        }else{
            botonFlotante.center = CGPoint(x: self.view.bounds.width - 42.0, y: self.view.bounds.height - 100)
        }
        botonFlotante.addTarget(self,
                                action: #selector(showNewVC), for: .touchUpInside)
        self.view.addSubview(botonFlotante)
        

        // Do any additional setup after loading the view.
    }

    //MARK: - UTILS
    
    @objc func showNewVC(){
       let toolVC = self.storyboard?.instantiateViewController(withIdentifier: "HerramientaPostTableViewController") as! HerramientaPostTableViewController
        let navC = UINavigationController(rootViewController: toolVC)
        self.present(navC, animated: true, completion: nil)
        
    }
    
    
}






