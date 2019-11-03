//
//  LoginModel.swift
//  PriceBoxApp
//
//  Created by Burak Yılmaz on 2.11.2019.
//  Copyright © 2019 Burak Yılmaz. All rights reserved.
//

import Foundation

struct LoginModel : Codable {
    let response : Bool?
    let token : String?
    let msg : String?
}

