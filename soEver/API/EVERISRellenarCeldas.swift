//
//  EVERISRellenarCeldas.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 6/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import Kingfisher

public class EVERISRellenarCeldas{
    
    func tipoGenericColletionView(_ customCell : MovieCustomCell, arrayGenerico : GenericModel, row : Int) -> MovieCustomCell{
        customCell.myValueData.text = arrayGenerico.rentalPrice
        customCell.myLabelData.text = arrayGenerico.category
        if let pathImage = arrayGenerico.image{
            customCell.myImageViewMovie.kf.setImage(with: ImageResource(downloadURL: URL(string: pathImage)!),
                                                    placeholder: #imageLiteral(resourceName: "placeholder"),
                                                    options: [.transition(ImageTransition.fade(1))],
                                                    progressBlock: nil,
                                                    completionHandler: { (imageData, error, cacheType, imageUrl) in
                                                        guard let imageDataDes = imageData else {return}
                                                        diccionarioImagenes[arrayGenerico.id!] = imageDataDes
                                                        
            })
        }
        return customCell
    }
    
    func tipoGeneric(_ customCell : GenericCell, arrayGenerico : GenericModel, row : Int) -> GenericCell{
        customCell.myNome.text = arrayGenerico.category
        customCell.myPrice.text = arrayGenerico.rentalPrice
        customCell.myDate.text = arrayGenerico.releaseDate
        customCell.mySummary.text = arrayGenerico.summary
        if let pathImage = arrayGenerico.image{
            customCell.myImageView.kf.setImage(with: ImageResource(downloadURL: URL(string: pathImage)!),
                                                    placeholder: #imageLiteral(resourceName: "placeholder"),
                                                    options: [.transition(ImageTransition.fade(1))],
                                                    progressBlock: nil,
                                                    completionHandler: { (imageData, error, cacheType, imageUrl) in
                                                        guard let imageDataDes = imageData else {return}
                                                        diccionarioImagenes[arrayGenerico.id!] = imageDataDes
                                                        
            })
        }
        return customCell
    }
    
}
