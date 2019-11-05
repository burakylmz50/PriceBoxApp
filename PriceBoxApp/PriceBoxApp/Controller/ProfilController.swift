//
//  ProfilController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 5.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class ProfilController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var KullaniciAdSoyad: UITextField!
    @IBOutlet weak var sifreTxt: UITextField!
    @IBOutlet weak var yeniSifreTxt: UITextField!
    @IBOutlet weak var yeniSifreTekrarTxt: UITextField!
    @IBOutlet weak var sifreyiDegistirBttn: UIButton!
    @IBOutlet weak var cikisYapBttn: UIButton!
    
    @IBAction func backBttn(_ sender: Any) {
          self.performSegue(withIdentifier: "profilToHomePage", sender: self)
    }
    @IBAction func sifreyiDegistirBttn(_ sender: Any) {
    }
    @IBAction func cikisYapBttn(_ sender: Any) {
         self.performSegue(withIdentifier: "profilToLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        padding()
        
    }
    func padding(){
        
        
        sifreTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        yeniSifreTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        yeniSifreTekrarTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        
        
        
        sifreTxt.delegate = self
        yeniSifreTxt.delegate = self
        yeniSifreTekrarTxt.delegate = self
        
        
        
        KullaniciAdSoyad.layer.cornerRadius = 11
        sifreTxt.layer.cornerRadius = 11
        yeniSifreTxt.layer.cornerRadius = 11
        yeniSifreTekrarTxt.layer.cornerRadius = 11
        sifreyiDegistirBttn.layer.cornerRadius = 11
        
        
        sifreTxt.layer.borderWidth = 1.0
        sifreTxt.layer.borderColor = UIColor.darkGray.cgColor
        yeniSifreTxt.layer.borderWidth = 1.0
        yeniSifreTxt.layer.borderColor = UIColor.darkGray.cgColor
        yeniSifreTekrarTxt.layer.borderWidth = 1.0
        yeniSifreTekrarTxt.layer.borderColor = UIColor.darkGray.cgColor
        sifreyiDegistirBttn.layer.borderWidth = 1.0
        sifreyiDegistirBttn.layer.borderColor = UIColor.darkGray.cgColor
        
        
        
        sifreTxt.attributedPlaceholder = NSAttributedString(string: "Güncel Şifre", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        yeniSifreTxt.attributedPlaceholder = NSAttributedString(string: "Yeni Şifre", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        yeniSifreTekrarTxt.attributedPlaceholder = NSAttributedString(string: "Şifre Tekrarı", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
        
        sifreyiDegistirBttn.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0)
        
        cikisYapBttn.tintColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
