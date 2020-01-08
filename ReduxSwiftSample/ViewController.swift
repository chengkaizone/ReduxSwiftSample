//
//  ViewController.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        let control = UIStoryboard.initFromStoryboard(LoginViewController.self)
        self.navigationController?.pushViewController(control, animated: true)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        
        let control = UIStoryboard.initFromStoryboard(RegisterViewController.self)
        self.navigationController?.pushViewController(control, animated: true)
    }
}

