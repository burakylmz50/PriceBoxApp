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
    @IBOutlet weak var bakiye: UILabel!
    
    @IBAction func backBttn(_ sender: Any) {
        self.performSegue(withIdentifier: "profilToHomePage", sender: self)
    }
    @IBAction func sifreyiDegistirBttn(_ sender: Any) {
        if yeniSifreTxt.text == yeniSifreTekrarTxt.text{
            self.profilView.sifremiDegistir(password: yeniSifreTxt.text!, oldPassword: sifreTxt.text!, completionHandler: {
                Dictionary in print(Dictionary)
                if(Dictionary == true){
                    DispatchQueue.main.async {
                        print("ayse merhaba")
                        let alert = UIAlertController(title: "Uyarı", message: "Şifre Değiştirme işlemi başarılı.", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                        alert.addAction(okButton)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                else{
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Parola", message: "Parolalar uyuşmamaktadır.", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                        alert.addAction(okButton)
                        self.present(alert, animated: true, completion: nil)
                        //                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                    }
                }
            })
        }
        else{
            let alert = UIAlertController(title: "Parola", message: "Parolalar uyuşmamaktadır.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func cikisYapBttn(_ sender: Any) {
        self.performSegue(withIdentifier: "profilToLogin", sender: self)
    }
    var profilView = ProfilView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilView.kullaniciBilgileriniGetir( completion: { response in
            DispatchQueue.main.async {
                self.KullaniciAdSoyad.text = self.profilView.burakasd
                self.bakiye.text = "Bakiye: " + self.profilView.bakiye
            }
            
            
        })
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
