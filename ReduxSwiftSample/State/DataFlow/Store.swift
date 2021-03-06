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
    
    init() {
        self.setupObservers()
    }
    
    func setupObservers() {
        
    }
    
    func dispatch(action: AppAction) {
        
        #if DEBUG
        debugPrint("ACTION:[\(action)]")
        #endif
        
        let result = AccountReducer.reduce(state: appState, action: action)
        appState = result.0
        
        NSLog("[通知UI更新--》]")
        let notificationObj = (action, appState)
        if Thread.isMainThread {
            NotificationCenter.default.post(name: NSNotification.Name(NOTIFICATION_CHANGE_STATE), object: notificationObj)
        } else {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name(NOTIFICATION_CHANGE_STATE), object: notificationObj)
            }
        }
        // 这里需要发出去更新UI
        if let command = result.1 {
            command.execute(in: self)
        }
    }
    
}

fileprivate class DisposeBag {
    
    private var values: [AnyCancellable] = []
    func add(_ value: AnyCancellable) {
        values.append(value)
    }
}

fileprivate extension AnyCancellable {
    
    func add(to bag: DisposeBag) {
        bag.add(self)
    }
}
