//
//  TMRectButtonConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation

open class TMRectButtonConfig {
    /// 标题
    public var title: String
    /// 字体
    public var font: CGFloat

    public init(title: String, font: CGFloat) {
        self.title = title
        self.font = font
    }
}
