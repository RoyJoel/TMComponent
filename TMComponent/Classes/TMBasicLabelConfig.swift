//
//  TMBasicLabelConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation

open class TMBasicLabelConfig {
    /// 标题
    public var title: String
    /// 字体
    public var font: UIFont
    
    public init(title: String, font: UIFont = UIFont.systemFont(ofSize: 17)) {
        self.title = title
        self.font = font
    }
}
