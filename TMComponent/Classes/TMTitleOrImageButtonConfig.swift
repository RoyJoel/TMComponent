//
//  TMTitleOrImageButtonConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/3/2.
//

import Foundation
open class TMTitleOrImageButtonConfig {
    /// 图片
    public var image: UIImage?
    /// 标题
    public var title: String?
    
    public var action: Selector
    ///
    public var actionTarget: Any

    public init(image: UIImage? = nil, title: String? = nil, action: Selector, actionTarget: Any) {
        self.image = image
        self.title = title
        self.action = action
        self.actionTarget = actionTarget
    }
}
