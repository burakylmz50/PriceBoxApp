//
//  SifremiUnuttumView.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 6.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

class SifremiUnuttumView{
    
    var email : String = ""
  
    var errorMessage : String = ""
    func sifremiUnuttum(email:String,completionHandler:@escaping (Bool) -> ()){
        
        let parameters = ["email": email as Any] as [String : Any]
        
        let url = URL(string: "https://priceboxfx.azurewebsites.net/api/pass/forgot")! //change the url
        
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
//         request.addValue(tokenDonus, forHTTPHeaderField: "x-auth-token")
        
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
                    let gitData = try decoder.decode(SifremiUnuttumModel.self, from: data)
                    if(gitData.response == true){
                        print("şifre değiştirildi")
                        completionHandler(true)
//                        tokenDonus = gitData.token!
                        
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
                print("asdasd")
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
