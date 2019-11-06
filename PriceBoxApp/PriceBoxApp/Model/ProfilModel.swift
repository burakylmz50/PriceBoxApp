//
//  ProfilModel.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 5.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

struct ProfilModel : Codable {
    let msg : String?
    let respons : Bool?
}

struct ProfilModelKullaniciData :Codable{
    let _id : String?
    let name : String?
    let email : String?
    let userNumber : String?
    let date : String?
}
