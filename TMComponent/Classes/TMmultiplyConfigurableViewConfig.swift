//
//  TMLabelConfig.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation
import UIKit

open class TMmultiplyConfigurableViewConfig {
    public var rowHeight: CGFloat
    public var rowSpacing: CGFloat
    public var configs: [TMPointComparingViewConfig]

    public init(rowHeight: CGFloat, rowSpacing: CGFloat, configs: [TMPointComparingViewConfig]) {
        self.rowHeight = rowHeight
        self.rowSpacing = rowSpacing
        self.configs = configs
    }
}
