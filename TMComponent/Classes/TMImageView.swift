//
//  TMImageView.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/26.
//

import Foundation

open class TMImageView: UIImageView {
    public var originalBounds: CGRect = .init()

    public var originalPoint: CGPoint = .init()

    public var newBounds: CGRect = .init()

    public var newPoint: CGPoint = .init()

    public var scaleTimes: CGFloat = .init()

    public var duration: CFTimeInterval = 0

    public var toggle: Bool = false

    public func setup(_ originalBounds: CGRect, _ originalPoint: CGPoint, _ newBounds: CGRect, _ newPoint: CGPoint, _ duration: CFTimeInterval) {
        self.originalBounds = originalBounds
        self.originalPoint = originalPoint
        self.newBounds = newBounds
        self.newPoint = newPoint
        self.duration = duration
    }

    open func scaleTo(_ isEnlarge: Bool) {
        if !isEnlarge {
            toggle.toggle()
            addAnimation(originalPoint, newPoint, duration, "position", completionHandler: {})
            addAnimation(originalBounds, newBounds, duration, "bounds", completionHandler: {})
            self.bounds = self.newBounds
            self.layer.position = self.newPoint
        } else {
            toggle.toggle()
            addAnimation(newBounds, originalBounds, duration, "bounds", completionHandler: {})
            addAnimation(newPoint, originalPoint, duration, "position", completionHandler: {})
            self.bounds = self.originalBounds
            self.layer.position = self.originalPoint
        }
    }
    
    open func scaleTo(_ isEnlarge: Bool, completionHandler: @escaping () -> Void) {
        if !isEnlarge {
            toggle.toggle()
            addAnimation(originalPoint, newPoint, duration, "position", completionHandler: {})
            addAnimation(originalBounds, newBounds, duration, "bounds", completionHandler: {
                completionHandler()
            })
            self.layer.position = self.newPoint
            self.bounds = self.newBounds
        } else {
            toggle.toggle()
            addAnimation(newBounds, originalBounds, duration, "bounds", completionHandler: {})
            addAnimation(newPoint, originalPoint, duration, "position", completionHandler: {
                completionHandler()
            })
            self.layer.position = self.originalPoint
            self.bounds = self.originalBounds
        }
    }
}
