//
//  TMLabelConfig.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/19.
//

import Foundation

open class TMLabelConfig {
    /// 标题
    public var title: String
    /// 字体
    public var font: CGFloat
    
    public init(title: String, font: CGFloat) {
        self.title = title
        self.font = font
    }
}
