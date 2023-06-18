//
//  TMLabelConfig.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation
import UIKit

open class TMmultiplyConfigurableViewConfig {
    /// 层高
    public var rowHeight: CGFloat
    /// 层间距
    public var rowSpacing: CGFloat
    /// 配置项数组，每个配置项对应一层
    public var configs: [TMPointComparingViewConfig]

    public init(rowHeight: CGFloat, rowSpacing: CGFloat, configs: [TMPointComparingViewConfig]) {
        self.rowHeight = rowHeight
        self.rowSpacing = rowSpacing
        self.configs = configs
    }
}
