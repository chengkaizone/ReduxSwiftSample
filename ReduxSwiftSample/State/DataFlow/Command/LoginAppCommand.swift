//
//  LoginAppCommand.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

struct LoginAppCommand: AppCommand {
    var username: String
    var password: String
    
    func execute(in store: Store) {
        
        _ = LoginRequest(username: username, password: password)
            .publisher
            .sink(receiveCompletion: { complete in
                
                switch complete {
                case .failure(let error):
                    store.dispatch(action: .accountBehaviorDone(result: .failure(error)))
                default:
                    break
                }
            }) { user in
                store.dispatch(action: .accountBehaviorDone(result: .success(user)))
        }
    }
}
