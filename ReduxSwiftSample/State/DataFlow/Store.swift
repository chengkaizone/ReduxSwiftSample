//
//  Store.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation
import Combine

class Store: ObservableObject {
    
//    var shared: Store {
//
//    }
    
    var appState: AppState = AppState()
    
    func dispatch(action: AppAction) {
        
        #if DEBUG
        debugPrint("ACTION:[\(action)]")
        #endif
        
        let result = AccountReducer.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            command.execute(in: self)
        }
    }
    
}
