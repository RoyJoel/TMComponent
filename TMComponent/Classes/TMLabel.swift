//
//  TMLabel.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/19.
//

import Foundation
import UIKit

open class TMLabel: UILabel {
    /// 原始尺寸
    public var originalBounds: CGRect = .init()
    /// 原始位置
    public var originalPoint: CGPoint = .init()
    /// 移动后的尺寸
    public var newBounds: CGRect = .init()
    /// 移动后的位置
    public var newPoint: CGPoint = .init()
    /// 持续时间
    public var duration: CFTimeInterval = 0
    /// 开关，控制图像伸缩状态
    public var toggle: Bool = false
    /// 初始化原始位置与新位置
    public func setup(_ originalBounds: CGRect, _ originalPoint: CGPoint, _ newBounds: CGRect, _ newPoint: CGPoint, _ duration: CFTimeInterval) {
        self.originalBounds = originalBounds
        self.originalPoint = originalPoint
        self.newBounds = newBounds
        self.newPoint = newPoint
        self.duration = duration
    }
    /// 伸缩方法
    /// - Parameter isEnlarge: 是否为伸缩状态
    open func scaleTo(_ isEnlarge: Bool) {
        if !isEnlarge {
            toggle.toggle()
            addAnimation(originalPoint, newPoint, duration, "position", completionHandler: {})
            addAnimation(originalBounds, newBounds, duration, "bounds", completionHandler: {})
            bounds = newBounds
            layer.position = newPoint
        } else {
            toggle.toggle()
            addAnimation(newBounds, originalBounds, duration, "bounds", completionHandler: {})
            addAnimation(newPoint, originalPoint, duration, "position", completionHandler: {})
            bounds = originalBounds
            layer.position = originalPoint
        }
    }

    /// 带闭包的伸缩方法
    /// - Parameter isEnlarge: 是否为伸缩状态
    open func scaleTo(_ isEnlarge: Bool, completionHandler: @escaping () -> Void) {
        if !isEnlarge {
            toggle.toggle()
            addAnimation(originalPoint, newPoint, duration, "position", completionHandler: {})
            addAnimation(originalBounds, newBounds, duration, "bounds", completionHandler: {
                completionHandler()
            })
            bounds = newBounds
            layer.position = newPoint
        } else {
            toggle.toggle()
            addAnimation(newBounds, originalBounds, duration, "bounds", completionHandler: {})
            addAnimation(newPoint, originalPoint, duration, "position", completionHandler: {
                completionHandler()
            })
            bounds = originalBounds
            layer.position = originalPoint
        }
    }

    public func setupEvent(config: TMLabelConfig) {
        text = config.title
        font = UIFont.systemFont(ofSize: config.font)
    }
}
