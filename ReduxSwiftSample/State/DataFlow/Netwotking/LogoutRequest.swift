//
//  LogoutRequest.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation
import Combine

struct LogoutRequest {
    
    var publisher: AnyPublisher<User?, AppError> {
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                
                promise(.success(nil))
            }
        }.receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
