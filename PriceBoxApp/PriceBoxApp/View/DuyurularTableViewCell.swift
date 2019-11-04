//
//  DuyurularTableViewCell.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 4.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class DuyurularTableViewCell: UITableViewCell {
    
    @IBOutlet weak var duyuruMetin: UILabel!
    @IBOutlet weak var tarihMetin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        duyuruMetin.textColor = UIColor.white
        tarihMetin.textColor = UIColor.white
        
        //labeltext uzun yazı gelirse alt satıra geçmesini sağlıyor.
        duyuruMetin.lineBreakMode = .byWordWrapping
        tarihMetin.lineBreakMode = .byWordWrapping
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
