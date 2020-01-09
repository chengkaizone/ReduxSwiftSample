//
//  AppError.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

struct AppError: Error {
    
    var message: String
    var error: Error?
    
    init(_ message: String, error: Error? = nil) {
        self.message = message
        self.error = error
    }
}


