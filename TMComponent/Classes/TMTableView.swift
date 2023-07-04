//
//  TMTableView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/16.
//

import Foundation
import UIKit

open class TMTableView: UITableView {
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
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        isScrollEnabled = false
        
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
            UITableView.appearance().isPrefetchingEnabled = false
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(_ originalBounds: CGRect, _ originalPoint: CGPoint, _ newBounds: CGRect, _ newPoint: CGPoint, _ duration: CFTimeInterval) {
        self.originalBounds = originalBounds
        self.originalPoint = originalPoint
        self.newBounds = newBounds
        self.newPoint = newPoint
        self.duration = duration
    }
    /// 展开
    open func unfold(completionHandler: (() -> Void)? = nil) {
        isScrollEnabled = true
        toggle = true
        addAnimation(originalPoint, newPoint, duration, "position", completionHandler: {})
        addAnimation(originalBounds, newBounds, duration, "bounds", completionHandler: {
            (completionHandler ?? {})()
        })
        bounds = newBounds
        layer.position = newPoint
    }
    /// 折叠
    open func fold(completionHandler: (() -> Void)? = nil) {
        // 折叠后不可滑动
        isScrollEnabled = false
        toggle = false
        addAnimation(newBounds, originalBounds, duration, "bounds", completionHandler: {})
        addAnimation(newPoint, originalPoint, duration, "position", completionHandler: {
            (completionHandler ?? {})()
        })
        bounds = originalBounds
        layer.position = originalPoint
    }
    
    open func scaleTo(_ isEnlarge: Bool) {
        if isEnlarge {
            fold()
        }else {
            unfold()
        }
    }
    
    open func scaleTo(_ isEnlarge: Bool, completionHandler: @escaping () -> Void) {
        if isEnlarge {
            fold(completionHandler: completionHandler)
        }else {
            unfold(completionHandler: completionHandler)
        }
    }
}


