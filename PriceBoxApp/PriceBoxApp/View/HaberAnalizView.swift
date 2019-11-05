//
//  HaberAnaliz.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 4.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

class HaberAnalizView{
    var haberAnalizText : [HaberAnlizModel] = []
    
    func haberAnalizGetir(){
        
        let urlString = "https://glacial-thicket-60288.herokuapp.com/api/analyze"
        let session = URLSession.shared
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNWRiYTk1YWVkZjA1ODIxMDNjMjk0ZmJlIn0sImlhdCI6MTU3Mjk2Mjg1OSwiZXhwIjoxNTcyOTk4ODU5fQ.8Gxsg6PEVvyHbRgq4tJYzMkF02MjcXJDLG0VjVyoHi4", forHTTPHeaderField: "x-auth-token")
        
        session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode([HaberAnlizModel].self, from: data)
                    
                    //Table View için reload datayı burada çağıramıyoruz. O yüzden NotificationCenter kullanıyoruz.
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
                    
                    self.haberAnalizText = gitData
                }
                catch {
                    print(error)
                }
            }
            
        }).resume()
        
    }
}

