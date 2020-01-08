//
//  AppAction.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

enum AppAction {
    
    case register(username: String, password: String, passwordVerify: String)
    case login(username: String, password: String)
    case accountBehaviorDone(result: Result<User?, AppError>)
    case logout
    case logoutDone
}
