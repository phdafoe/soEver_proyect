//
//  AplicacionesViewController.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 31/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import PromiseKit
import Kingfisher
import APESuperHUD

class AplicacionesViewController: UIViewController {

    //MARK: - Properties
    var arrayGenerico : [GenericModel] = []
    var refresh = UIRefreshControl()
    
    //MARK: - IBOulets
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Aplicaciones"
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //REGISTRO DE LA CELDA
        myTableView.register(UINib(nibName: GenericCell.defaultIdentifier, bundle: nil), forCellReuseIdentifier: GenericCell.defaultIdentifier)
        
        //LLAMADA
        llamadaGenerica()
        
        refresh.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresh.addTarget(self, action: #selector(self.refreshMovies), for: .valueChanged)
        myTableView.addSubview(refresh)
        
        
    }

    @objc func refreshMovies(){
        llamadaGenerica()
        self.refresh.endRefreshing()
    }
    
    func llamadaGenerica(){
        let provider = ProviderService()
        let parser = ParserGenerico()
        let idName = "topfreeapplications"
        let idCountry = "us"
        
        
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
                        self?.myTableView.reloadData()
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


extension AplicacionesViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayGenerico.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelData = arrayGenerico[indexPath.row]
        let customcell = myTableView.dequeueReusableCell(withIdentifier: GenericCell.defaultIdentifier, for: indexPath) as! GenericCell
        let cell = EVERISRellenarCeldas().tipoGeneric(customcell,arrayGenerico: modelData,row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}













