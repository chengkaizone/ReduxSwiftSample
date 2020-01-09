//
//  EmailCheckingRequest.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/9.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation
import Combine

/// 注册时的远程邮箱验证，判断是否有重复注册
struct EmailCheckingRequest {
    let email: String
    
    var publisher: AnyPublisher<Bool, Never> {
        Future<Bool, Never> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                if self.email.lowercased() == "tony@email.com" {// 代表注册过
                    promise(.success(false))
                } else {
                    promise(.success(true))
                }
            }
        }.receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
