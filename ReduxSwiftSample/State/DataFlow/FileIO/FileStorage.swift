//
//  FileStorage.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/9.
//  Copyright © 2020 tony. All rights reserved.
//

import Foundation

/**
 文件持久化，在参数赋值时，根据变化自动写入文件
 */
@propertyWrapper
struct FileStorage<T: Codable> {
    var value: T?

    let directory: FileManager.SearchPathDirectory
    let fileName: String

    init(directory: FileManager.SearchPathDirectory, fileName: String) {
        value = try? FileHelper.loadJSON(from: directory, fileName: fileName)
        self.directory = directory
        self.fileName = fileName
    }

    var wrappedValue: T? {
        set {
            value = newValue
            if let value = newValue {
                try? FileHelper.writeJSON(value, to: directory, fileName: fileName)
            } else {
                try? FileHelper.delete(from: directory, fileName: fileName)
            }
        }

        get { value }
    }
}
