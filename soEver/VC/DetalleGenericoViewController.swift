//
//  DetalleGenericoViewController.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 31/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import MapKit
import PromiseKit
import Kingfisher
import APESuperHUD

class DetalleGenericoViewController: UITableViewController {

    //MARK: - Variables
    var dataModel : GenericModel?
    var detalleImage : UIImage?
    var arrayGenerico : [GenericModel] = []
    var latitud = 40.352467
    var longitud = -3.809620
    
    
    //MARK: - IBOutlest
    @IBOutlet weak var myBackgroundImage: UIImageView!
    @IBOutlet weak var myImageMovie: UIImageView!
    @IBOutlet weak var myFechaModel: UILabel!
    @IBOutlet weak var myTituloModel: UILabel!
    @IBOutlet weak var myNameModel: UILabel!
    @IBOutlet weak var myTitleModel: UILabel!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var mySummaryText: UILabel!
    @IBOutlet weak var myMovilButton: UIButton!
    @IBOutlet weak var myWebSiteButton: UIButton!
    @IBOutlet weak var myEmailMe: UILabel!
    @IBOutlet weak var myMapView: MKMapView!
    
    
    @IBAction func myMovilCallMeACTION(_ sender: UIButton) {
        let telefono = sender.titleLabel?.text
        if let telefonoDes = telefono{
            llamarMovil(telefonoDes)
        }
        print("Aqui llamando")
    }
    
    @IBAction func myWebSiteACTION(_ sender: Any) {
        let web = (sender as! UIButton).titleLabel?.text 
        if let webDes = web{
            muestraWebSite(webDes)
        }
        print("Aqui mostrando la web")
    }
    
    @IBAction func mySearchACTION(_ sender: Any) {
        openMap()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LLAMADA
        llamadaGenerica()
        
        if let movieDes = dataModel{
            self.title = movieDes.name
            myBackgroundImage.image = detalleImage
            myImageMovie.image = detalleImage
            myTituloModel.text = "Lorem Ipsum es simplemente el texto de relleno de las imprentas "
            myNameModel.text = movieDes.genres![0].name
            myTitleModel.text = movieDes.name
            myFechaModel.text = movieDes.releaseDate
            mySummaryText.text = randomLorem()
            myMovilButton.setTitle("653940573", for: .normal)
            myWebSiteButton.setTitle(movieDes.name, for: .normal)
        }
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitud, longitude: longitud), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        myMapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        annotation.title = dataModel?.name
        annotation.subtitle = dataModel?.name
        myMapView.addAnnotation(annotation)
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 0{
            return UITableViewAutomaticDimension
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    

    //MARK: - UTILS
    func llamarMovil(_ telefono : String){
        if let phoneCall = URL(string: "tel://\(telefono)"){
            let application : UIApplication = UIApplication.shared
            if application.canOpenURL(phoneCall){
                application.open(phoneCall,
                                 options: [:],
                                 completionHandler: nil)
            }
        }
    }
    
    func muestraWebSite(_ url : String){
        let webVC = self.storyboard?.instantiateViewController(withIdentifier: "WebViewGenericoViewController") as! WebViewGenericoViewController
        guard let dataModelDes = dataModel else { return }
        webVC.myUrl = dataModelDes.url
        present(webVC, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    func openMap(){
        let regionDistance : CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [MKLaunchOptionsMapCenterKey : NSValue(mkCoordinate: regionSpan.center),
                       MKLaunchOptionsMapSpanKey : NSValue(mkCoordinateSpan: regionSpan.span)]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = dataModel?.name
        mapItem.openInMaps(launchOptions: options)
    }
    
    func llamadaGenerica(){
        let provider = ProviderService()
        let parser = ParserGenerico()
        
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard,
                                    message: "Loading",
                                    presentingView: self.view)
        firstly{
            return when(resolved: provider.getServiceData(randomIdCountry(),
                                                          idFirstPath: CONSTANTES.ARGUMENTOS.BOOKS_FIRST_PATH,
                                                          idSecondPath: CONSTANTES.ARGUMENTOS.BOOKS_SECOND_PATH,
                                                          idNumber: randomIdNumber()))
            }.then{_ in
                parser.getGenericParser({ [weak self] (result) in
                    self?.arrayGenerico = result
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

//MARK: - extension DetalleGenericoViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension DetalleGenericoViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
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
        let modelData = arrayGenerico[indexPath.row]
        let webVC = self.storyboard?.instantiateViewController(withIdentifier: "WebViewGenericoViewController") as! WebViewGenericoViewController
        webVC.myUrl = modelData.url
        present(webVC, animated: true, completion: nil)
    }
    
    
    
}


