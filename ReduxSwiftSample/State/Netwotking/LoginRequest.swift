//
//  LoginRequest.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation
import Combine

struct LoginRequest {
    var username: String
    var password: String
    
    var publisher: AnyPublisher<User, AppError> {
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                if self.username.count == 0 {
                    promise(.failure(.failed(error: "用户名不能为空")))
                } else if self.password == "password" {
                    let user = User(username: self.username, password: self.password)
                    promise(.success(user))
                } else {
                    promise(.failure(.failed(error: "登录失败")))
                }
            }
        }.receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
