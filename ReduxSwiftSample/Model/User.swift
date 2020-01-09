//
//  User.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

struct User {
    
    var username: String
    var password: String
    
    func toString() -> String {
        return "Username: \(username) Password: \(password)"
    }
}
