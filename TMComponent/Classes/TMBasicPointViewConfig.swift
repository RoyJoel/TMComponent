//
//  TMBasicPointConfig.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation
import UIKit

open class TMBasicPointViewConfig {
    /// 高亮图片是否为左侧
    public var isLeft: Bool
    /// 本地图片名称
    public var iconName: String?
    /// 是否为高亮状态
    public var isServing: Bool
    /// 标签文字
    public var text: String
    /// 标签字体
    public var font: UIFont

    public init(isLeft: Bool, iconName: String? = nil, isServing: Bool, text: String, font: UIFont) {
        self.isLeft = isLeft
        self.iconName = iconName
        self.isServing = isServing
        self.text = text
        self.font = font
    }
}
