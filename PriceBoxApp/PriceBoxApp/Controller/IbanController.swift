//
//  IbanController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 4.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class IbanController: UIViewController , UITextFieldDelegate {
    
    var ibanView = IbanView()
    var secim : String = ""
    @IBOutlet weak var segmentedCntrl: UISegmentedControl!
    @IBAction func segmentedCntrl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0 :
            secim = "TL"
            break
        case 1:
            secim = "USD"
            break
        default:
            break
        }
    }
    @IBOutlet weak var bankaAdiTxt: UITextField!
    @IBOutlet weak var ibanNoTxt: UITextField!
    @IBOutlet weak var aliciAdiTxt: UITextField!
    @IBOutlet weak var amountTxt: UITextField!
    @IBOutlet weak var onaylaBttn: UIButton!
    
    @IBAction func onaylaBttn(_ sender: Any) {
        self.ibanView.createUser2(ibanBankName:bankaAdiTxt.text!, ibanRecipientName: aliciAdiTxt.text!, ibanNumber: ibanNoTxt.text!, amountTxt: amountTxt.text!,priceFormat:secim, completionHandler: {
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
    
    @objc func tapCancel() {
        print("tapped cancel")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTxt.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)))
        padding()
        
    }
    
    func padding(){
        segmentedCntrl.tintColor = UIColor.white
        segmentedCntrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red:0.00, green:0.58, blue:0.51, alpha:1.0)], for: .selected)
        segmentedCntrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        bankaAdiTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        ibanNoTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        aliciAdiTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        amountTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        
        bankaAdiTxt.delegate = self
        ibanNoTxt.delegate = self
        aliciAdiTxt.delegate = self
        amountTxt.delegate = self
        
        bankaAdiTxt.layer.cornerRadius = 11
        ibanNoTxt.layer.cornerRadius = 11
        aliciAdiTxt.layer.cornerRadius = 11
        amountTxt.layer.cornerRadius = 11
        onaylaBttn.layer.cornerRadius = 11
        
        bankaAdiTxt.layer.borderWidth = 1.0
        bankaAdiTxt.layer.borderColor = UIColor.darkGray.cgColor
        ibanNoTxt.layer.borderWidth = 1.0
        ibanNoTxt.layer.borderColor = UIColor.darkGray.cgColor
        aliciAdiTxt.layer.borderWidth = 1.0
        aliciAdiTxt.layer.borderColor = UIColor.darkGray.cgColor
        amountTxt.layer.borderWidth = 1.0
        amountTxt.layer.borderColor = UIColor.darkGray.cgColor
        
        bankaAdiTxt.attributedPlaceholder = NSAttributedString(string: "Banka Adı", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        ibanNoTxt.attributedPlaceholder = NSAttributedString(string: "IBAN No", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        aliciAdiTxt.attributedPlaceholder = NSAttributedString(string: "Alıcı Adı", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        amountTxt.attributedPlaceholder = NSAttributedString(string: "Tutar", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        
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

//NumberPad üzerine done butonu eklemek için.
extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil) {
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Tamam", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }}
