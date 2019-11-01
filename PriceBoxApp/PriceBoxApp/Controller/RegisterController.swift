//
//  ViewController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 1.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class RegisterController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var adSoyad: UITextField!
    @IBOutlet weak var emailAdresi: UITextField!
    @IBOutlet weak var sifre: UITextField!
    @IBOutlet weak var sifreTekrari: UITextField!
    @IBOutlet weak var kayitOl: UIButton!
    @IBAction func closeBttn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func kayitOl(_ sender: Any) {
        if(sifre.text == sifreTekrari.text){
            self.registerView.createUser(adSoyad: adSoyad.text!, emailAdresi: emailAdresi.text!, sifre: sifre.text!)
        }
        else{
            let alert = UIAlertController(title: "Uyarı", message: "Parolalar uyuşmamaktadır.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    var registerView = RegisterView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        padding()
    }
    
    func padding(){
        adSoyad.delegate = self
        emailAdresi.delegate = self
        sifre.delegate = self
        sifreTekrari.delegate = self
        
        adSoyad.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        emailAdresi.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        sifre.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        sifreTekrari.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        
        adSoyad.layer.cornerRadius = 11
        emailAdresi.layer.cornerRadius = 11
        sifre.layer.cornerRadius = 11
        sifreTekrari.layer.cornerRadius = 11
        kayitOl.layer.cornerRadius = 11
        
        adSoyad.layer.borderWidth = 1.0
        adSoyad.layer.borderColor = UIColor.darkGray.cgColor
        emailAdresi.layer.borderWidth = 1.0
        emailAdresi.layer.borderColor = UIColor.darkGray.cgColor
        sifre.layer.borderWidth = 1.0
        sifre.layer.borderColor = UIColor.darkGray.cgColor
        sifreTekrari.layer.borderWidth = 1.0
        sifreTekrari.layer.borderColor = UIColor.darkGray.cgColor
        
        adSoyad.attributedPlaceholder = NSAttributedString(string: "Ad Soyad", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        emailAdresi.attributedPlaceholder = NSAttributedString(string: "E-Mail Adresi", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        sifre.attributedPlaceholder = NSAttributedString(string: "Şifre", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        sifreTekrari.attributedPlaceholder = NSAttributedString(string: "Şifre Tekrarı", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
        adSoyad.autocapitalizationType = .words
        
        kayitOl.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

