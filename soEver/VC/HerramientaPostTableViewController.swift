//
//  HerramientaPostTableViewController.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 12/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class HerramientaPostTableViewController: UITableViewController {
    
    //MARK: - properties
    let fechaHumano = Date()
    
    //MARK: - IBOutlest
    @IBOutlet weak var myImageProfile: UIImageView!
    @IBOutlet weak var myNameProfile: UILabel!
    @IBOutlet weak var myDatePost: UILabel!
    @IBOutlet weak var myDescriptionPost: UITextView!
    @IBOutlet weak var myImagePost: UIImageView!
    
    //MARK: - IBActions
    
    @IBAction func closeVCACTION(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bloque toolbar
        let barraFlexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        let colorButtons = CONSTANTES.COLORES.COLOR_TEXT_NAV
        let colorBarra = CONSTANTES.COLORES.COLOR_NAV_TAB
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        toolBar.barStyle = UIBarStyle.blackOpaque
        toolBar.tintColor = colorBarra
        toolBar.barTintColor = colorButtons
        
        let camera = UIBarButtonItem(image: #imageLiteral(resourceName: "camara"),
                                     style: .done,
                                     target: self,
                                     action: #selector(showPickerPhoto))
        
        let saveData = UIBarButtonItem(title: "Save",
                                       style: .plain,
                                       target: self,
                                       action: #selector(saveDateWithSingleton))
        
        toolBar.items = [camera, barraFlexible, saveData]
        myDescriptionPost.inputAccessoryView = toolBar
        
        myImageProfile.image = #imageLiteral(resourceName: "steve_jobs")
        myNameProfile.text = "@so.ever123465"
        let customDate = DateFormatter()
        myDatePost.text = customDate.string(from: fechaHumano)
        
        let gestureRecog = UITapGestureRecognizer(target: self,
                                                  action: #selector(hideKeyboard))
        tableView.addGestureRecognizer(gestureRecog)
        

        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 1{
            return UITableViewAutomaticDimension
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myDescriptionPost.becomeFirstResponder()
    }
    
    //MARK: - UTILS
    @objc func hideKeyboard(){
        myDescriptionPost.resignFirstResponder()
    }
    
    @objc func saveDateWithSingleton(){
        dismiss(animated: true, completion: nil)
    }
    

}//MARK: - FIN DE LA CLASE


extension HerramientaPostTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @objc func showPickerPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            muestraMenu()
        }else{
            muestraLibreria()
        }
    }
    
    func muestraMenu(){
        let menuVC = UIAlertController(title: nil,
                                       message: nil, preferredStyle: .actionSheet)
        menuVC.addAction(UIAlertAction(title: "CANCELAR",
                                       style: .cancel, 
                                       handler: nil))
        menuVC.addAction(UIAlertAction(title: "CAMARA DE FOTOS",
                                       style: .default,
                                       handler: { _ in
                                        self.muestraCamaraFotos()
        }))
        menuVC.addAction(UIAlertAction(title: "LIBRERIA DE FOTOS",
                                       style: .default,
                                       handler: { _ in
                                        self.muestraLibreria()
        }))
        present(menuVC, animated: true, completion: nil)
    }
    
    func muestraLibreria(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func muestraCamaraFotos(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImagePost.image = imageData
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}







