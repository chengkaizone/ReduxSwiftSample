//
//  AppError.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

enum AppError: Error {
    
    case success(message: String)
    case failed(error: String)
    case networkingFailure(error: Error)
}


