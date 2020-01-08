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
    
    var appState: AppState = AppState()
    
    func dispatch(action: AppAction) {
        
        #if DEBUG
        debugPrint("ACTION:[\(action)]")
        #endif
        
        let result = AccountReducer.reduce(state: appState, action: action)
        appState = result.0
        
        NSLog("[通知UI更新--》]")
        // 这里需要发出去更新UI
        if let command = result.1 {
            command.execute(in: self)
        }
    }
    
}
