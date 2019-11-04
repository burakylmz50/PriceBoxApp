//
//  DuyurularView.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 3.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

class DuyurularView{
    var duyuruText : [DuyurularModel] = []
    
    func duyurulariGetir(){
        
        let urlString = "https://glacial-thicket-60288.herokuapp.com/api/announcement"
        let session = URLSession.shared
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNWRiYTk1YWVkZjA1ODIxMDNjMjk0ZmJlIn0sImlhdCI6MTU3Mjg2NDYzNywiZXhwIjoxNTcyOTAwNjM3fQ.fMlTVM7BFK5eb4filb9cEuKDnK5Clz1OAmov_VaEpWI", forHTTPHeaderField: "x-auth-token")
        
        session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode([DuyurularModel].self, from: data)
                    
                    //Table View için reload datayı burada çağıramıyoruz. O yüzden NotificationCenter kullanıyoruz.
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
                    
                    self.duyuruText = gitData
                }
                catch {
                    print(error)
                }
            }
            
        }).resume()
        
    }
}
