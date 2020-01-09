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
        self.title = "用户登录"
        
        if let user = AppDelegate.shared().store.appState.user {
            usernameField.text = user.username
            passwordField.text = user.password
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        AppDelegate.shared().store.dispatch(action: .login(username: username, password: password))
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        AppDelegate.shared().store.dispatch(action: .logout)
    }
    
    override func onChangeState(action: AppAction, state: AppState) {
        
        switch action {
        case .login(_, _):
            // 显示等待对话框
            resultTextView.text = "正在登录中..."
            break
        case .accountBehaviorDone(let result):
            // 关闭等待对话框
            switch result {
            case .success(let user):
                resultTextView.text = "登录成功：\(user!.toString())"
            case .failure(let error):
                resultTextView.text = "登录失败：\(error.message)"
            }
            break
        case .logout:
            resultTextView.text = "正在退出中..."
            break
        case .logoutDone:
            resultTextView.text = "退出登录成功!"
            break
        default:
            break
        }
    }
    
}
