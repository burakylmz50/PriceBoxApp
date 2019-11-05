//
//  VirmanController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 5.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class VirmanController: UIViewController , UITextFieldDelegate{
    
    var virmanView = VirmanView()
    @IBOutlet weak var alinacakHesapNoTxt: UITextField!
    @IBOutlet weak var hedefHesapNoTxt: UITextField!
    @IBOutlet weak var tutarTxt: UITextField!
    @IBOutlet weak var onaylaBttn: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
          self.performSegue(withIdentifier: "VirmanToParaCekme", sender: self)
    }
    @IBAction func onaylaBttn(_ sender: Any) {
        self.virmanView.createUser2( virmanFrom: alinacakHesapNoTxt.text!, virmanTo: hedefHesapNoTxt.text!, amount: tutarTxt.text!, completionHandler: {
            Dictionary in print(Dictionary)
            if(Dictionary == false){
                DispatchQueue.main.async {
                    print("ayse merhaba")
                    //                       let alert = UIAlertController(title: "Uyarı", message: self.loginView.errorMessage, preferredStyle: .alert)
                    //                       let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                    //                       alert.addAction(okButton)
                    //                       self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Tebrikler!", message: "Talebiniz Başarıyla Alınmıştır.", preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
//                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                }
            }
        })
    }
    
    @objc func tapDone() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        alinacakHesapNoTxt.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)))
        hedefHesapNoTxt.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)))
        tutarTxt.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)))
        super.viewDidLoad()
        padding()
        
    }
    func padding(){
        
        
        alinacakHesapNoTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        hedefHesapNoTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        tutarTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        
        
        alinacakHesapNoTxt.delegate = self
        hedefHesapNoTxt.delegate = self
        tutarTxt.delegate = self
        
        
        alinacakHesapNoTxt.layer.cornerRadius = 11
        hedefHesapNoTxt.layer.cornerRadius = 11
        tutarTxt.layer.cornerRadius = 11
        onaylaBttn.layer.cornerRadius = 11
        
        alinacakHesapNoTxt.layer.borderWidth = 1.0
        alinacakHesapNoTxt.layer.borderColor = UIColor.darkGray.cgColor
        hedefHesapNoTxt.layer.borderWidth = 1.0
        hedefHesapNoTxt.layer.borderColor = UIColor.darkGray.cgColor
        tutarTxt.layer.borderWidth = 1.0
        tutarTxt.layer.borderColor = UIColor.darkGray.cgColor
        
        
        alinacakHesapNoTxt.attributedPlaceholder = NSAttributedString(string: "Alınacak Hesap No", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        hedefHesapNoTxt.attributedPlaceholder = NSAttributedString(string: "Hedef Hesap No", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        tutarTxt.attributedPlaceholder = NSAttributedString(string: "Tutar", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
        onaylaBttn.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
