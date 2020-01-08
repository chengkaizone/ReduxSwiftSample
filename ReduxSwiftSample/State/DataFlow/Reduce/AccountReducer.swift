//
//  AccountReducer.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

class AccountReducer {
    
    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        
        var state = state
        var command: AppCommand?
        
        switch action {
        case .register(let username, let password, let passwordVerify):
            state.accountRequesting = true
            command = RegisterAppCommand(username: username, password: password, passwordVerify: passwordVerify)
        case .login(let username, let password):
            state.accountRequesting = true
            command = LoginAppCommand(username: username, password: password)
        case .accountBehaviorDone(let result):
            state.accountRequesting = false
            switch result {
            case .success(let user):
                state.user = user
                if user == nil {// 注册成功
                    
                }
            case .failure(let error):
                state.accountError = error
            }
        case .logout:
            state.accountRequesting = true
            command = LogoutAppCommand()
        case .logoutDone:
            state.accountRequesting = false
        }
        
        return (state, command)
    }
    
}
