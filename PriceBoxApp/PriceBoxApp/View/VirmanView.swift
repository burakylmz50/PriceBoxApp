//
//  VirmanView.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 5.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

class VirmanView{
    
    var virmanFrom : String = ""
    var virmanTo : String = ""
    var amount : String = ""

    var errorMessage : String = ""
    func createUser2(virmanFrom:String,virmanTo:String,amount:String,completionHandler:@escaping (Bool) -> ()){
        
        let parameters = ["virmanFrom": virmanFrom as Any ,  "virmanTo": virmanTo as Any,"amount": amount as Any ] as [String : Any]
        
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
                    let gitData = try decoder.decode(VirmanModel.self, from: data)
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
