//
//  BaseViewController.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import UIKit

let NOTIFICATION_CHANGE_STATE = "change_state"
@objc class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onChangedState(_:)), name: NSNotification.Name(NOTIFICATION_CHANGE_STATE), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func onChangedState(_ notification: Notification) {
        
        let result = notification.object as! (AppAction, AppState)
        
        onChangeState(action: result.0, state: result.1)
    }
    
    func onChangeState(action: AppAction, state: AppState) {
        
    }
    
}
