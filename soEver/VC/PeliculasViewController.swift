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
    var refresh = UIRefreshControl()
    
    //MARK: - IBOutlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Peliculas"
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        //LLAMADA
        llamadaGenerica()
        
        refresh.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresh.addTarget(self, action: #selector(self.refreshMovies), for: .valueChanged)
        myCollectionView.addSubview(refresh)
        
    }
    
    @objc func refreshMovies(){
        llamadaGenerica()
        self.refresh.endRefreshing()
    }
    
    func llamadaGenerica(){
        let provider = ProviderService()
        let parser = ParserGenerico()
        let idName = "topmovies"
        let idCountry = "es"
        
        
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard,
                                    message: "Loading",
                                    presentingView: self.view)
        firstly{
            return when(resolved: provider.getServiceData(idName,
                                                          idCountry: idCountry,
                                                          idNumber: randomIdNumber()))
            }.then{_ in
                parser.getGenericParser({ [weak self] (result) in
                    //guard let resultDes = result else { return }
                    self?.arrayGenerico = result
                    print(result)
                    DispatchQueue.main.async {
                        self?.myCollectionView.reloadData()
                    }
                })
            }.then{_ in
                APESuperHUD.removeHUD(animated: true,
                                      presentingView: self.view,
                                      completion: nil)
            }.catch{error in
                print(error.localizedDescription)
        }
        
        
        
        
        
    }
    

}
//MARK: - FIN DE CLASE


//MARK: - extension PeliculasViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension PeliculasViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayGenerico.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let modelData = arrayGenerico[indexPath.row]
        let customcell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MovieCustomCell
        let cell = EVERISRellenarCeldas().tipoGenericColletionView(customcell,
                                                                   arrayGenerico: modelData,
                                                                   row: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSpacing = CGFloat(1)
        let leftRightMar = CGFloat(20)
        let numColmuns = CGFloat(2)
        let totalCellSpace = cellSpacing * (numColmuns - 1)
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - leftRightMar - totalCellSpace) / numColmuns
        var height = CGFloat(270)
        height = width * height / 180
        return CGSize(width: width, height: height)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
