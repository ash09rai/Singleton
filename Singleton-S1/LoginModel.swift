//
//  LoginModel.swift
//  Singleton-S1
//
//  Created by Ashish Rai on 13/08/21.
//

import Foundation


//MARK:- Models
struct Feeditems {}

struct LoggedInuser {
    var name: String
    
    func getNameData() -> Data? {
        return name.data(using: .utf8)
    }
}
