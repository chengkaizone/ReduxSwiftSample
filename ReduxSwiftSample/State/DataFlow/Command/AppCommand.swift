//
//  AppCommand.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation
import Combine

protocol AppCommand {
    
    func execute(in store: Store)
}

struct LoginAppCommand: AppCommand {
    var username: String
    var password: String
    
    func execute(in store: Store) {
        
        
    }
}

struct RegisterAppCommand: AppCommand {
    var username: String
    var password: String
    var passwordVerify: String
    
    func execute(in store: Store) {
        //_ = Register
    }
}

struct LogoutAppCommand: AppCommand {
    
    func execute(in store: Store) {
        //_ = Register
    }
}
