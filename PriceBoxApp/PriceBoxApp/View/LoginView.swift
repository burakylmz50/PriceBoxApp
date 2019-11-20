//
//  LoginView.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 2.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation
import UIKit

var tokenDonus : String = ""  // Kullanıcı giris yaptıktan sonra dönen token değeri.

class LoginView:UIViewController{
    var emailAdresi : String = ""
    var sifre : String = ""
    
    var errorMessage : String = ""
    func createUser(emailAdresi:String,sifre:String,completionHandler:@escaping (Bool) -> ()){
        
        let parameters = ["email": emailAdresi as Any ,  "password": sifre as Any] as [String : Any]
        
        let url = URL(string: "https://priceboxfx.azurewebsites.net/api/auth")! //change the url
        
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
                    print(json)
                    // handle json...
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(LoginModel.self, from: data)
                    if(gitData.response == true){
                        print("Giriş başarılı")
                        completionHandler(true)
                        tokenDonus = gitData.token!
                        
                        DispatchQueue.main.async(){
                            //                              self.performSegue(withIdentifier: "loginToHome", sender: self)
                        }
                    }
                    else{
                        self.errorMessage = gitData.msg!
                        completionHandler(false)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
