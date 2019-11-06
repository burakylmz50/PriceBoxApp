//
//  SifremiUnuttumController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 6.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class SifremiUnuttumController: UIViewController , UITextFieldDelegate {
    
    @IBAction func backBttn(_ sender: Any) {
        self.performSegue(withIdentifier: "sifremiUnuttumToLogin", sender: self)
    }
    @IBOutlet weak var mailAdresiTxt: UITextField!
    @IBOutlet weak var sifremiSifirla: UIButton!
    @IBAction func şifremiSifirla(_ sender: Any) {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        padding()
        
    }
    
    func padding(){
        mailAdresiTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        
        mailAdresiTxt.delegate = self
        
        mailAdresiTxt.layer.cornerRadius = 11
        sifremiSifirla.layer.cornerRadius = 11
        
        mailAdresiTxt.layer.borderWidth = 1.0
        mailAdresiTxt.layer.borderColor = UIColor.darkGray.cgColor
        sifremiSifirla.layer.borderWidth = 1.0
        sifremiSifirla.layer.borderColor = UIColor.darkGray.cgColor
        
        mailAdresiTxt.attributedPlaceholder = NSAttributedString(string: "Mail Adresi", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
        sifremiSifirla.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0)
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
