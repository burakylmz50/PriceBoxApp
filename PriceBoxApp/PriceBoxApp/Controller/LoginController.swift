//
//  LoginController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 2.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class LoginController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var emailAdresi: UITextField!
    @IBOutlet weak var sifre: UITextField!
    @IBOutlet weak var girisYap: UIButton!
    @IBAction func sifremiUnuttum(_ sender: Any) {
            self.performSegue(withIdentifier: "loginToSifremiUnuttum", sender: self)
    }
    @IBAction func girisYap(_ sender: Any) {
        self.loginView.createUser(emailAdresi:emailAdresi.text! , sifre : sifre.text!, completionHandler: {
            Dictionary in print(Dictionary)
            if(Dictionary == false){
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Uyarı", message: self.loginView.errorMessage, preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                }
            }
        })
    }
    var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        padding()
    }
    
    func padding(){
        emailAdresi.delegate = self
        sifre.delegate = self
        
        //        yazı girerken otomatik düzeltmeyi kapatıyor.
        emailAdresi.autocorrectionType = .no
        
        emailAdresi.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        sifre.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        
        emailAdresi.layer.cornerRadius = 11
        sifre.layer.cornerRadius = 11
        girisYap.layer.cornerRadius = 11
        
        emailAdresi.layer.borderWidth = 1.0
        emailAdresi.layer.borderColor = UIColor.darkGray.cgColor
        sifre.layer.borderWidth = 1.0
        sifre.layer.borderColor = UIColor.darkGray.cgColor
        
        emailAdresi.attributedPlaceholder = NSAttributedString(string: "E-Mail Adresi", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        sifre.attributedPlaceholder = NSAttributedString(string: "Şifre", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
        
        girisYap.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
