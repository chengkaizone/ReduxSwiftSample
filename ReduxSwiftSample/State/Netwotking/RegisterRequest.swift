//
//  RegisterRequest.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation
import Combine

struct RegisterRequest {
    var username: String
    var password: String
    var passwordVertify: String
    
    var publisher: AnyPublisher<User?, AppError> {
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                
                if self.username == "tony@email.com" {
                    promise(.failure(.failed(error: "用户名已注册")))
                } else if self.username.count < 6 || self.username.count > 16 {
                    promise(.failure(.failed(error: "用户名长度限制为6~16位")))
                } else {
                    if self.password != self.passwordVertify {
                        promise(.failure(.failed(error: "两次密码不一致！")))
                    } else if self.password.count < 6 || self.password.count > 16 {
                        promise(.failure(.failed(error: "密码长度限制为6~16位")))
                    } else {
                        promise(.success(nil))
                    }
                }
            }
        }.receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
