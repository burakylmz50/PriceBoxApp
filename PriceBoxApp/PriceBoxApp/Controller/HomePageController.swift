//
//  HomePageController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 3.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class HomePageController: UIViewController {
    
    @IBOutlet weak var duyurularBttn: UIButton!
    @IBOutlet weak var haberAnalizBttn: UIButton!
    @IBOutlet weak var paraCekBttn: UIButton!
    @IBOutlet weak var profilBttn: UIButton!
    
    @IBAction func duyurularBttn(_ sender: Any) {
        self.performSegue(withIdentifier: "homeToDuyurular", sender: self)
    }
    @IBAction func haberAnalizBttn(_ sender: Any) {
        self.performSegue(withIdentifier: "homeToHaberAnaliz", sender: self)
    }
    @IBAction func paraCekBttn(_ sender: Any) {
    }
    @IBAction func profilBttn(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        duyurularBttn.layer.cornerRadius = 11
        haberAnalizBttn.layer.cornerRadius = 11
        paraCekBttn.layer.cornerRadius = 11
        profilBttn.layer.cornerRadius = 11
        
        duyurularBttn.layer.borderWidth = 2.0
        duyurularBttn.layer.borderColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0).cgColor
        haberAnalizBttn.layer.borderWidth = 2.0
        haberAnalizBttn.layer.borderColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0).cgColor
        paraCekBttn.layer.borderWidth = 2.0
        paraCekBttn.layer.borderColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0).cgColor
        profilBttn.layer.borderWidth = 2.0
        profilBttn.layer.borderColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0).cgColor
    }
    
}
