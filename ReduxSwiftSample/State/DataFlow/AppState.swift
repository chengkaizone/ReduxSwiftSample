//
//  AppState.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

struct AppState {
    
    var accountRequesting: Bool = false
    
    var user: User?
    
    var accountError: AppError?
}
