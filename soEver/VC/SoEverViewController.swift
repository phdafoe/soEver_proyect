//
//  SoEverViewController.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 31/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class SoEverViewController: UIViewController {
    
    //MARK: - IBOutles
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        let logoSocial = #imageLiteral(resourceName: "title_So_Ever")
        self.navigationItem.titleView = UIImageView(image: logoSocial)

        //REgistro de celdas
        myTableView.register(UINib(nibName: GenericPerfilTableViewCell.defaultIdentifier, bundle: nil), forCellReuseIdentifier: GenericPerfilTableViewCell.defaultIdentifier)
        
        myTableView.register(UINib(nibName: GenericCell.defaultIdentifier, bundle: nil), forCellReuseIdentifier: GenericCell.defaultIdentifier)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableView.reloadData()
    }
    
}

extension SoEverViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return APiTaskManager.shared.descripcionText.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = myTableView.dequeueReusableCell(withIdentifier: GenericPerfilTableViewCell.defaultIdentifier, for: indexPath) as! GenericPerfilTableViewCell
            return cell
        default:
            let postCell = myTableView.dequeueReusableCell(withIdentifier: GenericCell.defaultIdentifier, for: indexPath) as! GenericCell
            let arrayDescription = APiTaskManager.shared.descripcionText[indexPath.row]
            let arrayImagenes = APiTaskManager.shared.fotoPost[indexPath.row]
            
            postCell.mySummary.text = arrayDescription[CONSTANTES.NSUSERDEFAULT.KEY_DESCRIP_POST] as? String
            
            if let imagePostDes = arrayImagenes[CONSTANTES.NSUSERDEFAULT.KEY_IMAGE_POST] as? Data{
                let storage = imagePostDes
                postCell.myImageView.image = UIImage(data: storage)
            }
            return postCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 305
        default:
            return UITableViewAutomaticDimension
        }
    }
    
    
}












