//
//  TMScalable.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation
import UIKit

/// 一个用于对UIView及其子类进行可伸缩功能扩展的协议。提供了一组方法和属性，使得遵循该协议的视图可以方便地实现伸缩效果，即将视图的尺寸进行动态调整。
protocol TMScalable {
    /// 原始尺寸
    var originalBounds: CGRect { get set }
    /// 原始位置
    var originalPoint: CGPoint { get set }
    /// 移动后的尺寸
    var newBounds: CGRect { get set }
    /// 移动后的位置
    var newPoint: CGPoint { get set }
    /// 持续时间
    var duration: CFTimeInterval { get set }
    /// 开关，控制图像伸缩状态
    var toggle: Bool { get set }
    /// 初始化原始位置与新位置
    func setup(originalBounds: CGRect, originalPoint: CGPoint, newBounds: CGRect, newPoint: CGPoint, duration: CFTimeInterval)
    /// 带闭包的伸缩方法
    /// - Parameter completionHandler: 动画完成后的闭包
    func scaleTo(completionHandler: (() -> Void)?)
}
