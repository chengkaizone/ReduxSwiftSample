//
//  RegisterViewController.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import UIKit

/**
* 用户注册
 */
class RegisterViewController: BaseViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordVerifyField: UITextField!
    
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        let passwordVerify = passwordVerifyField.text!
        
        AppDelegate.shared().store.dispatch(action: .register(username: username, password: password, passwordVerify: passwordVerify))
    }
    
}
