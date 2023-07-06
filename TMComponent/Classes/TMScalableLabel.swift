//
//  TMScalableLabel.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/19.
//

import Foundation
import UIKit

/// 可伸缩的UILabel
open class TMScalableLabel: UILabel, TMScalable {
    /// 原始尺寸
    internal var originalBounds: CGRect = .init()
    /// 原始位置
    internal var originalPoint: CGPoint = .init()
    /// 移动后的尺寸
    internal var newBounds: CGRect = .init()
    /// 移动后的位置
    internal var newPoint: CGPoint = .init()
    /// 持续时间
    internal var duration: CFTimeInterval = 0
    /// 开关，控制图像伸缩状态
    public var toggle: Bool = false
    /// 初始化原始位置与新位置
    public func setup(originalBounds: CGRect, originalPoint: CGPoint, newBounds: CGRect, newPoint: CGPoint, duration: CFTimeInterval) {
        self.originalBounds = originalBounds
        self.originalPoint = originalPoint
        self.newBounds = newBounds
        self.newPoint = newPoint
        self.duration = duration
    }

    /// 带闭包的伸缩方法
    /// - Parameter completionHandler: 动画完成后的动作
    open func scaleTo(completionHandler: (() -> Void)? = nil) {
        toggle.toggle()

        let startPoint = toggle ? originalPoint : newPoint
        let endPoint = toggle ? newPoint : originalPoint
        let startBounds = toggle ? originalBounds : newBounds
        let endBounds = toggle ? newBounds : originalBounds

        addAnimation(startPoint, endPoint, duration, "position", completionHandler: {})
        addAnimation(startBounds, endBounds, duration, "bounds", completionHandler: {
            (completionHandler ?? {})()
        })

        bounds = endBounds
        layer.position = endPoint
    }
}
