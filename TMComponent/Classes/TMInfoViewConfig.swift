//
//  TMInfoViewConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/3/24.
//

import Foundation

open class TMInfoViewConfig {
    /// 内容信息
    public var infoContent: String
    /// 内容字体大小
    public var infoContentFont: UIFont
    /// 标题信息
    public var infoTitle: String
    /// 标题字体大小
    public var infoTitleFont: UIFont
    /// 内容距离父视图的下边距以及标题距离父视图的上边距
    public var inset: Int

    public init(infoContent: String, infoContentFont: UIFont, infoTitle: String, infoTitleFont: UIFont, inset: Int) {
        self.infoContent = infoContent
        self.infoContentFont = infoContentFont
        self.infoTitle = infoTitle
        self.infoTitleFont = infoTitleFont
        self.inset = inset
    }
}
