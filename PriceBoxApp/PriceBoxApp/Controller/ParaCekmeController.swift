//
//  ParaCekmeController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 4.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class ParaCekmeController: UIViewController {

    @IBAction func backBttn(_ sender: Any) {
         self.performSegue(withIdentifier: "paraCekmeToHome", sender: self)
    }
    
    @IBAction func ibanBttn(_ sender: Any) {
    }
    @IBAction func virmanBttn(_ sender: Any) {
    }
    @IBAction func krediKartBttn(_ sender: Any) {
    }

    @IBOutlet weak var ibanBttn: UIButton!
    @IBOutlet weak var virmanBttn: UIButton!
    @IBOutlet weak var krediKartBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ibanBttn.layer.cornerRadius = 11
        virmanBttn.layer.cornerRadius = 11
        krediKartBttn.layer.cornerRadius = 11
        
        ibanBttn.layer.borderWidth = 2.0
        ibanBttn.layer.borderColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0).cgColor
        virmanBttn.layer.borderWidth = 2.0
        virmanBttn.layer.borderColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0).cgColor
        krediKartBttn.layer.borderWidth = 2.0
        krediKartBttn.layer.borderColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0).cgColor
        
        ibanBttn.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:0.2)
        virmanBttn.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:0.2)
        krediKartBttn.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:0.2)

    }
}
