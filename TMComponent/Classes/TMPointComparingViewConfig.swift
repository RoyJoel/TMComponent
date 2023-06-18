//
//  TMVSViewConfig.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation
import UIKit

open class TMPointComparingViewConfig {
    /// 标题标签是否在比分视图之上
    public var isTitleLabelAbovePointView: Bool
    /// 标题标签是否隐藏
    public var isTitleHidden: Bool
    /// 标题内容
    public var title: String?
    /// 本地头像名称
    public var iconName: String?
    /// 当前是否左侧高亮
    public var isServingOnLeft: Bool
    /// 是否两侧高亮
    public var areBothServing: Bool
    /// 是否需要高亮
    public var isComparing: Bool
    /// 字体
    public var font: UIFont
    /// 左侧标签内容
    public var leftText: String
    /// 右侧标签内容
    public var rightText: String

    public init(isTitleLabelAbovePointView: Bool, isTitleHidden: Bool, title: String? = nil, iconName: String? = nil, isServingOnLeft: Bool, areBothServing: Bool, isComparing: Bool, font: UIFont, leftText: String, rightText: String) {
        self.isTitleLabelAbovePointView = isTitleLabelAbovePointView
        self.isTitleHidden = isTitleHidden
        self.title = title
        self.iconName = iconName
        self.isServingOnLeft = isServingOnLeft
        self.areBothServing = areBothServing
        self.isComparing = isComparing
        self.font = font
        self.leftText = leftText
        self.rightText = rightText
    }
}
