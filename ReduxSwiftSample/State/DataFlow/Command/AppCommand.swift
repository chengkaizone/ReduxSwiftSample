//
//  AppCommand.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation
import Combine

protocol AppCommand {
    
    func execute(in store: Store)
    
}
