//
//  TMScalableButton.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation

/// 可伸缩的UIButton
open class TMScalableButton: UIButton, TMScalable {
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
    public func scaleTo(willScaleTo: (() -> Void)? = nil, didScaleTo: (() -> Void)? = nil) {
        toggle.toggle()
        
        if toggle {
            super.scaleTo(fromBounds: originalBounds, andPosition: originalPoint, toBounds: newBounds, andNewPosition: newPoint, duration: duration, willScaleTo: willScaleTo ?? {}, didScaleTo: didScaleTo ?? {})
        }else {
            super.scaleTo(fromBounds: newBounds, andPosition: newPoint, toBounds: originalBounds, andNewPosition: originalPoint, duration: duration, willScaleTo: willScaleTo ?? {}, didScaleTo: didScaleTo ?? {})
        }
    }
}
