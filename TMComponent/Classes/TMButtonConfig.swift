//
//  TMButtonConfig.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation

open class TMButtonConfig {
    /// 图片
    public var image: UIImage?
    /// 标题
    public var title: String?
    /// 行为
    public var action: Selector
    /// 目标
    public var actionTarget: Any

    public init(image: UIImage? = nil, title: String? = nil, action: Selector, actionTarget: Any) {
        self.image = image
        self.title = title
        self.action = action
        self.actionTarget = actionTarget
    }
}
