//
//  PeliculasViewController.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 31/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import PromiseKit
import Kingfisher
import APESuperHUD

class PeliculasViewController: UIViewController {
    
    //MARK: - Properties
    var arrayGenerico : [GenericModel] = []
    
    //MARK: - IBOutlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Peliculas"

    }
    

}
//MARK: - FIN DE CLASE

extension PeliculasViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayGenerico.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customcell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionCell", for: indexPath) as! MovieCustomCell
        return customcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
