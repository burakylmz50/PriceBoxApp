//
//  LoginView.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 1.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

class RegisterView{
    var adSoyad : String = ""
    var emailAdresi : String = ""
    var sifre : String = ""
    
    func createUser(adSoyad :String,emailAdresi:String,sifre:String){
        
        let parameters = ["name": adSoyad as Any, "email": emailAdresi as Any ,  "password": sifre as Any] as [String : Any]
        
        let url = URL(string: "https://glacial-thicket-60288.herokuapp.com/api/users")! //change the url
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    //       print(json)
                    // handle json...
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(RegisterModel.self, from: data)
                    if(gitData.response == true){
                        print("kayıt harbiden başarılı olmuş ya la")
                        DispatchQueue.main.async(){
                            //                            self.performSegue(withIdentifier: "uyeOldun", sender: self)
                        }
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
