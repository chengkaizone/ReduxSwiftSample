//
//  LogoutAppCommand.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

struct LogoutAppCommand: AppCommand {
    
    func execute(in store: Store) {
        _ = LogoutRequest().publisher
            .sink(receiveCompletion: { complete in
                switch complete {
                case .failure(_):
                    store.dispatch(action: .logoutDone)
                default:
                    break
                }
            }, receiveValue: { (user: User?) in
                store.dispatch(action: .logoutDone)
            })
    }
}
