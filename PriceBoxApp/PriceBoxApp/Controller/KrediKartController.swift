//
//  KrediKartController.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 5.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import UIKit

class KrediKartController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerView1 {
            return priorityTypesAy.count
            
        } else if pickerView == pickerView2{
            return priorityTypesYil.count
        }
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerView1 {
            return priorityTypesAy[row]
            
        } else if pickerView == pickerView2{
            return priorityTypesYil[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerView1 {
            selectedPriorityAy = priorityTypesAy[row]
            ayTxt.text = selectedPriorityAy
        } else if pickerView == pickerView2{
            selectedPriorityYil = priorityTypesYil[row]
            yilTxt.text = selectedPriorityYil
        }
        
        
        //        print(selectedPriority!)
    }
    
    func createPickerView(){
        pickerView1.delegate = self
        pickerView2.delegate = self
        pickerView1.dataSource = self
        pickerView2.dataSource = self
        
        ayTxt.inputView = pickerView1
        yilTxt.inputView = pickerView2
        
        
        pickerView1.tag = 1
        pickerView2.tag = 2
        
        ayTxt.inputView = pickerView1
        yilTxt.inputView = pickerView2
    }
    
    func dismissPickerView(){
        let toolbar = UIToolbar(frame: CGRect(x: 0,
        y: 50,
        width: 100,
        height: 100))
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexButton,doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        ayTxt.inputAccessoryView = toolbar
        yilTxt.inputAccessoryView = toolbar
        
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    var selectedPriorityAy :String = ""
    var selectedPriorityYil :String = ""
    var priorityTypesAy = ["01","02","03","04","05","06","07","08","09","10","11","12"]
    var priorityTypesYil = ["2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033",]
    
    var krediKartView = KrediKartView()
    
    @IBOutlet weak var ayTxt: UITextField!
    @IBOutlet weak var yilTxt: UITextField!
    @IBOutlet weak var KartNo: UITextField!
    @IBOutlet weak var cvcTxt: UITextField!
    @IBOutlet weak var tutarTxt: UITextField!
    @IBOutlet weak var kartUzerindekiAd: UITextField!
    @IBOutlet weak var onaylaBttn: UIButton!
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "KrediKartToParaCekme", sender: self)
    }
    
    @IBAction func onaylaBttn(_ sender: Any) {
          self.showSpinner(onView: self.view)
        let ayYil : String =  selectedPriorityAy + "/" + selectedPriorityYil
        self.krediKartView.creditCardPost(  cardNumber: KartNo.text!, cardName: kartUzerindekiAd.text!, cardDate: ayYil, cardCvv: cvcTxt.text!, amount: tutarTxt.text!, completionHandler: {
            Dictionary in print(Dictionary)
            if(Dictionary == false){
                DispatchQueue.main.async {
                    self.removeSpinner()
                    print("ayse merhaba")
                    //                       let alert = UIAlertController(title: "Uyarı", message: self.loginView.errorMessage, preferredStyle: .alert)
                    //                       let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                    //                       alert.addAction(okButton)
                    //                       self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                DispatchQueue.main.async {
                    self.removeSpinner()
                    let alert = UIAlertController(title: "Tebrikler!", message: "Talebiniz Başarıyla Alınmıştır.", preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                    //                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                }
            }
        })
    }
    
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()
    
    @objc func tapDone() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutarTxt.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)))
        cvcTxt.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)))
        KartNo.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)))
        dismissPickerView()
        createPickerView()
        padding()
    }
    func padding(){
        
        
        ayTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        yilTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        KartNo.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        cvcTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        tutarTxt.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        kartUzerindekiAd.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        
        
        ayTxt.delegate = self
        yilTxt.delegate = self
        KartNo.delegate = self
        cvcTxt.delegate = self
        tutarTxt.delegate = self
        kartUzerindekiAd.delegate = self
        
        
        ayTxt.layer.cornerRadius = 11
        yilTxt.layer.cornerRadius = 11
        KartNo.layer.cornerRadius = 11
        cvcTxt.layer.cornerRadius = 11
        tutarTxt.layer.cornerRadius = 11
        kartUzerindekiAd.layer.cornerRadius = 11
        onaylaBttn.layer.cornerRadius = 11
        
        ayTxt.layer.borderWidth = 1.0
        ayTxt.layer.borderColor = UIColor.darkGray.cgColor
        yilTxt.layer.borderWidth = 1.0
        yilTxt.layer.borderColor = UIColor.darkGray.cgColor
        KartNo.layer.borderWidth = 1.0
        KartNo.layer.borderColor = UIColor.darkGray.cgColor
        cvcTxt.layer.borderWidth = 1.0
        cvcTxt.layer.borderColor = UIColor.darkGray.cgColor
        tutarTxt.layer.borderWidth = 1.0
        tutarTxt.layer.borderColor = UIColor.darkGray.cgColor
        kartUzerindekiAd.layer.borderWidth = 1.0
        kartUzerindekiAd.layer.borderColor = UIColor.darkGray.cgColor
        
        
        kartUzerindekiAd.attributedPlaceholder = NSAttributedString(string: "Kart Üzerindeki İsim", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        KartNo.attributedPlaceholder = NSAttributedString(string: "Kart No", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        ayTxt.attributedPlaceholder = NSAttributedString(string: "Ay", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        yilTxt.attributedPlaceholder = NSAttributedString(string: "Yıl", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        cvcTxt.attributedPlaceholder = NSAttributedString(string: "CVC", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
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

