//
//  LoginController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 2.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//
var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
import UIKit

class LoginController: UIViewController , UITextFieldDelegate {
    
    
    @IBOutlet weak var emailAdresi: UITextField!
    @IBOutlet weak var sifre: UITextField!
    @IBOutlet weak var girisYap: UIButton!
    @IBAction func sifremiUnuttum(_ sender: Any) {
        self.performSegue(withIdentifier: "loginToSifremiUnuttum", sender: self)
    }
    @IBAction func girisYap(_ sender: Any) {
        
        self.showSpinner(onView: self.view)
        
        self.loginView.createUser(emailAdresi:emailAdresi.text! , sifre : sifre.text!, completionHandler: {
            Dictionary in print(Dictionary)
            if(Dictionary == false){
                DispatchQueue.main.async {
                    self.removeSpinner()
                    let alert = UIAlertController(title: "Uyarı", message: self.loginView.errorMessage, preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                
                DispatchQueue.main.async {
                    self.removeSpinner()
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
        
        //yazı girerken otomatik düzeltmeyi kapatıyor.
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
