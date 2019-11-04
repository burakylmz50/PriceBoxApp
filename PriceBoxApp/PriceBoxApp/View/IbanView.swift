//
//  IbanView.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 4.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

class IbanView{
    
    var ibanBankName : String = ""
    var ibanRecipientName : String = ""
    var ibanNumber : String = ""
    var amountTxt : String = ""
    var priceFormat : String = ""
    
    var errorMessage : String = ""
    func createUser2(ibanBankName:String,ibanRecipientName:String,ibanNumber:String,amountTxt:String,priceFormat:String,completionHandler:@escaping (Bool) -> ()){
        
        let parameters = ["ibanBankName": ibanBankName as Any ,  "ibanRecipientName": ibanRecipientName as Any,"ibanNumber": ibanNumber as Any ,"amountTxt": amountTxt as Any,"priceFormat": priceFormat as Any ] as [String : Any]
        
        let url = URL(string: "https://glacial-thicket-60288.herokuapp.com/api/account")! //change the url
        
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
         request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNWRiYTk1YWVkZjA1ODIxMDNjMjk0ZmJlIn0sImlhdCI6MTU3Mjg3NzU0MSwiZXhwIjoxNTcyOTEzNTQxfQ.600iMoDUVcWDrFgeQMxVrjDeXRgAt-SozWjkPU69rpU", forHTTPHeaderField: "x-auth-token")
        
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
                    let gitData = try decoder.decode(IbanModel.self, from: data)
                    if(gitData.response == true){
                        print("Giriş başarılı")
                        completionHandler(true)
//                        tokenDonus = gitData.token!
                        
                        DispatchQueue.main.async(){
                            //                              self.performSegue(withIdentifier: "loginToHome", sender: self)
                        }
                    }
                    else{
//                        self.errorMessage = gitData.msg!
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
