//
//  RegisterAppCommand.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

struct RegisterAppCommand: AppCommand {
    var username: String
    var password: String
    var passwordVerify: String
    
    func execute(in store: Store) {
        _ = RegisterRequest(username: username, password: password, passwordVertify: passwordVerify)
            .publisher
            .sink(receiveCompletion: { complete in
                switch complete {
                case .failure(let error):
                    store.dispatch(action: .accountBehaviorDone(result: .failure(error)))
                default:
                    break
                }
            }, receiveValue: { (user: User?) in
                store.dispatch(action: .accountBehaviorDone(result: .success(user)))
            })
    }
}

