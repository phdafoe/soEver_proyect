//
//  GenericCell.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 31/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class GenericCell: UITableViewCell, ReuseIdentifierInterface {
    
    
    //MARK: - IBOutltes
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myNome: UILabel!
    @IBOutlet weak var myPrice: UILabel!
    @IBOutlet weak var myDate: UILabel!
    @IBOutlet weak var mySummary: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
