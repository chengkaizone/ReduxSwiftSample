//
//  LoginViewController.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import UIKit

/**
 * 用户登录，退出登录
 */
class LoginViewController: BaseViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        AppDelegate.shared().store.dispatch(action: .login(username: username, password: password))
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        AppDelegate.shared().store.dispatch(action: .logout)
    }
    
}
