//
//  ProfilView.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 5.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

class ProfilView{
    
    var password : String = ""
    var oldPassword : String = ""
    var errorMesaj : String = ""
    
    func sifremiDegistir(password:String,oldPassword:String,completionHandler:@escaping (Bool) -> ()){
        
        let parameters = ["password": password as Any ,"oldPassword": oldPassword as Any  ] as [String : Any]
        
        let url = URL(string: "https://priceboxfx.azurewebsites.net/api/pass")! //change the url
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(tokenDonus, forHTTPHeaderField: "x-auth-token")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(ProfilModel.self, from: data)
                    if(gitData.respons == true){
                        print("Giriş başarılı")
                        completionHandler(true)
                        
                        //                        tokenDonus = gitData.token!
                        
                        DispatchQueue.main.async(){
                            
                            //                              self.performSegue(withIdentifier: "loginToHome", sender: self)
                        }
                    }
                    else{
                        self.errorMesaj = gitData.msg!
                        completionHandler(false)
                    }
                }
            } catch let error {
                print("asdasd")
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    var duyuruText : ProfilModelKullaniciData?
    var duyuruText22  : [String] = ["burak"]
    var burakasd : String = ""
    var bakiye : String = ""
    func kullaniciBilgileriniGetir( completion: @escaping (_ success: [String]) -> Void) {
        
        let urlString = "https://priceboxfx.azurewebsites.net/api/auth"
        let session = URLSession.shared
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.addValue(tokenDonus, forHTTPHeaderField: "x-auth-token")
        
        session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(ProfilModelKullaniciData.self, from: data)
                    
                    self.burakasd = gitData.name!
                    self.bakiye = gitData.userBalance!
                    
                    print(self.burakasd)
                    print(self.bakiye)
                    completion([self.burakasd])
                    completion([self.bakiye])
                }
                catch {
                    print(error)
                }
            }
            
        }).resume()
        
    }
}
