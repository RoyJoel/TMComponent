//
//  TMScalableView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2022/12/28.
//

import Foundation
import UIKit

/// 可伸缩的UIView
open class TMScalableView: UIView, TMScalable {
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
    
    public internal(set) var lastBeginTime: TimeInterval = 0
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
            super.scaleTo(lastbeginTime: <#TimeInterval#>, fromBounds: originalBounds, andPosition: originalPoint, toBounds: newBounds, andNewPosition: newPoint, duration: duration, willScaleTo: willScaleTo ?? {}, didScaleTo: didScaleTo ?? {})
        }else {
            super.scaleTo(lastbeginTime: <#TimeInterval#>, fromBounds: newBounds, andPosition: newPoint, toBounds: originalBounds, andNewPosition: originalPoint, duration: duration, willScaleTo: willScaleTo ?? {}, didScaleTo: didScaleTo ?? {})
        }
        
    }
    
//    private var isAnimating = false
//        private var animationProgress: TimeInterval = 0
//        private var reverseAnimationProgress: TimeInterval = 0
//        
//        /// 带闭包的伸缩方法
//        public func scaleTo(willScaleTo: (() -> Void)? = nil, didScaleTo: (() -> Void)? = nil) {
//            // If an animation is currently in progress, intercept it
//            if isAnimating {
//                isAnimating = false
//                reverseAnimationProgress = animationProgress
//            } else {
//                toggle.toggle()
//            }
//            
//            let originalScale = toggle ? originalBounds.width / newBounds.width : newBounds.width / originalBounds.width
//            
//            if toggle {
//                super.scaleTo(fromBounds: originalBounds, andPosition: originalPoint, toBounds: newBounds, andNewPosition: newPoint, duration: duration * Double(originalScale), willScaleTo: willScaleTo ?? {}, didScaleTo: { [weak self] in
//                    self?.animationDidFinish()
//                    didScaleTo?()
//                })
//            } else {
//                super.scaleTo(fromBounds: newBounds, andPosition: newPoint, toBounds: originalBounds, andNewPosition: originalPoint, duration: duration * Double(originalScale), willScaleTo: willScaleTo ?? {}, didScaleTo: { [weak self] in
//                    self?.animationDidFinish()
//                    didScaleTo?()
//                })
//            }
//        }
//        
//        private func animationDidFinish() {
//            isAnimating = false
//            animationProgress = 0
//            reverseAnimationProgress = 0
//        }
//        
//        // Override this method to update animation progress
//        override func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//            super.animationDidStop(anim, finished: flag)
//            
//            guard let animation = anim as? CABasicAnimation else {
//                return
//            }
//            
//            let progress = anim.duration - anim.timeOffset
//            if animation.fromValue as? CGFloat == 1.0 {
//                animationProgress = progress
//            } else {
//                reverseAnimationProgress = progress
//            }
//        }

    // 组动画，但目前还没有好的实现方案，暂时搁置
//    public func addGroupAnimation(with views: [UIView], isEnlarge: Bool) {
//        let widthRatio = newBounds.width / originalBounds.width
//        let xDistance = newPoint.x - originalPoint.x
//        let yDistance = newPoint.y - originalPoint.y
//
//        if isEnlarge {
//            for view in views {
//                view.addAnimation(view.layer.position, CGPoint(x: view.layer.position.x + xDistance, y: view.layer.position.y + yDistance), duration, "position")
//                view.addAnimation(view.bounds, CGRect(x: 0, y: 0, width: view.bounds.width * widthRatio, height: view.bounds.height * widthRatio), duration, "bounds")
//            }
//        } else {
//            for view in views {
//                view.addAnimation(CGPoint(x: view.layer.position.x + xDistance, y: view.layer.position.y + yDistance), view.layer.position, duration, "position")
//                view.addAnimation(CGRect(x: 0, y: 0, width: view.bounds.width * widthRatio, height: view.bounds.height * widthRatio), view.bounds, duration, "bounds")
//            }
//        }
//    }
}
