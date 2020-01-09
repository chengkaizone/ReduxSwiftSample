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
        self.title = "用户注册"
        
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        let passwordVerify = passwordVerifyField.text!
        
        AppDelegate.shared().store.dispatch(action: .register(username: username, password: password, passwordVerify: passwordVerify))
    }
    
    override func onChangeState(action: AppAction, state: AppState) {
        
        switch action {
        case .register(_, _, _):
            resultTextView.text = "正在注册..."
            break
        case .accountBehaviorDone(let result):
            switch result {
            case .success(_):
                resultTextView.text = "注册成功"
                let alert = UIAlertController(title: nil, message: "注册成功，是否前往登录？", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel))
                alert.addAction(UIAlertAction(title: "立即前往", style: UIAlertAction.Style.destructive, handler: {[weak self] (action) in
                    let control = UIStoryboard.initFromStoryboard(LoginViewController.self)
                    self?.navigationController?.pushViewController(control, animated: true)
                }))
                self.present(alert, animated: true)
            case .failure(let error):
                resultTextView.text = "注册失败: \(error.message)"
            }
            break
        default:
            break
        }
    }
    
}
