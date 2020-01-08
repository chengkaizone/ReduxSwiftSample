//
//  UIStoryboardExtension.swift
//  ReduxSwiftSample
//
//  Created by tony on 2020/1/8.
//  Copyright © 2020 tony. All rights reserved.
//

import UIKit

extension UIStoryboard {

    /**
     * 从故事板中初始化布局界面
     */
    class func initFromStoryboard(_ clazz: AnyClass!) -> UIViewController {
        let className = NSStringFromClass(clazz)
        let arr = className.components(separatedBy: ".")
        let identifier = arr[arr.count-1] as String
        return UIStoryboard.initFromStoryboardWithIdentifier(identifier)
    }

    /// 通过controller类名返回controller实例
    class func initFromStoryboardWithIdentifier(_ clazzName: String) -> UIViewController {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        return story.instantiateViewController(withIdentifier: clazzName)
    }
    
}
