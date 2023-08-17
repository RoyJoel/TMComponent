//
//  UIViewExtension.swift
//  TMComponents
//
//  Created by Jason Zhang on 2023/2/21.
//

import Foundation
import UIKit

extension UIView {
    public func setShadow(_ shadowRadius: CGFloat, _ shadowOffset: CGSize, _ shadowColor: CGColor = UIColor.black.cgColor, _ shadowOpacity: Float = 0.5) {
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
    }

    public func setCorner(radii: CGFloat, masksToBounds: Bool = true) {
        layer.cornerRadius = radii
        layer.masksToBounds = masksToBounds
    }

    public func drawBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }

    public func removeBorder() {
        layer.borderColor = nil
        layer.borderWidth = 0
    }

    public func addTapGesture(_ target: Any, _ action: Selector?) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tap)
    }

    public func addLongPressGesture(_ target: Any, _ action: Selector?) {
        let longPress = UILongPressGestureRecognizer(target: target, action: action)
        addGestureRecognizer(longPress)
    }

    public func addPanGesture(_ target: Any, _ action: Selector?) {
        let pan = UIPanGestureRecognizer(target: target, action: action)
        addGestureRecognizer(pan)
    }

    public func removeTapGesture(_ target: Any, _ action: Selector?) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        removeGestureRecognizer(tap)
    }

    public func addAnimation(_ fromValue: Any?, _ toValue: Any?, _ duration: CFTimeInterval, _ forKey: String?) {
        let animation = CABasicAnimation()
        animation.duration = duration
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.fillMode = .forwards

        layer.add(animation, forKey: forKey)
    }

    public func addAnimation(_ fromValue: Any?, _ toValue: Any?, _ duration: CFTimeInterval, _ forKey: String?, completionHandler: @escaping () -> Void) {
        let animation = CABasicAnimation()
        animation.duration = duration
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.fillMode = .forwards

        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completionHandler()
        }
        layer.add(animation, forKey: forKey)
        CATransaction.commit()
    }
    
    public func scaleTo(lastbeginTime: TimeInterval, fromBounds: CGRect, andPosition: CGPoint, toBounds: CGRect, andNewPosition: CGPoint, duration: CFTimeInterval) {
        let timer = CADisplayLink()
        timer.add(to: .main, forMode: .common)
        
        var bounds = CGRect()
        var position = CGPoint()
        
        if Date().timeIntervalSince1970 - duration >= lastbeginTime {
            bounds = fromBounds
            position = andPosition
        }else {
            let elapsed = timer.timestamp - lastbeginTime
            let progress = CGFloat(elapsed / duration)
            
            bounds = CGRect(x: fromBounds.minX - (fromBounds.minX - toBounds.minX) * progress, y: fromBounds.minY - (fromBounds.minY - toBounds.minY) * progress, width: fromBounds.width - (fromBounds.width - toBounds.width) * progress, height: fromBounds.height - (fromBounds.height - toBounds.height) * progress)
            
            position = CGPoint(x: andPosition.x - (andPosition.x - andNewPosition.x) * progress, y: andPosition.y - (andPosition.y - andNewPosition.y) * progress)
        }
        
        let boundsAnimation = CABasicAnimation()
        boundsAnimation.duration = duration
        boundsAnimation.fromValue = bounds
        boundsAnimation.toValue = toBounds
        boundsAnimation.fillMode = .forwards
        boundsAnimation.isRemovedOnCompletion = false
        
        let positionAnimation = CABasicAnimation()
        positionAnimation.duration = duration
        positionAnimation.fromValue = position
        positionAnimation.toValue = andNewPosition
        positionAnimation.fillMode = .forwards
        boundsAnimation.isRemovedOnCompletion = false

        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            guard let self = self else {
                return
            }
            self.bounds = toBounds
            self.layer.position = andNewPosition
            timer.remove(from: .main, forMode: .common)
            timer.invalidate()
        }
        layer.add(boundsAnimation, forKey: "bounds")
        layer.add(positionAnimation, forKey: "position")
        CATransaction.commit()
        
    }
    
    public func scaleTo(lastbeginTime: TimeInterval, fromBounds: CGRect, andPosition: CGPoint, toBounds: CGRect, andNewPosition: CGPoint, duration: CFTimeInterval,willScaleTo: @escaping () -> Void, didScaleTo: @escaping () -> Void) {
        
        let timer = CADisplayLink()
        timer.add(to: .main, forMode: .common)
        
        var bounds = CGRect()
        var position = CGPoint()
        
        if Date().timeIntervalSince1970 - duration >= lastbeginTime {
            bounds = fromBounds
            position = andPosition
        }else {
            let elapsed = timer.timestamp - lastbeginTime
            let progress = CGFloat(elapsed / duration)
            
            bounds = CGRect(x: fromBounds.minX - (fromBounds.minX - toBounds.minX) * progress, y: fromBounds.minY - (fromBounds.minY - toBounds.minY) * progress, width: fromBounds.width - (fromBounds.width - toBounds.width) * progress, height: fromBounds.height - (fromBounds.height - toBounds.height) * progress)
            
            position = CGPoint(x: andPosition.x - (andPosition.x - andNewPosition.x) * progress, y: andPosition.y - (andPosition.y - andNewPosition.y) * progress)
        }
        
        let boundsAnimation = CABasicAnimation()
        boundsAnimation.duration = duration
        boundsAnimation.fromValue = bounds
        boundsAnimation.toValue = toBounds
        boundsAnimation.fillMode = .forwards
        boundsAnimation.isRemovedOnCompletion = false
        
        let positionAnimation = CABasicAnimation()
        positionAnimation.duration = duration
        positionAnimation.fromValue = position
        positionAnimation.toValue = andNewPosition
        positionAnimation.fillMode = .forwards
        boundsAnimation.isRemovedOnCompletion = false
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            guard let self = self else {
                return
            }
            self.bounds = toBounds
            self.layer.position = andNewPosition
            didScaleTo()
            timer.remove(from: .main, forMode: .common)
            timer.invalidate()
        }
        willScaleTo()
        layer.add(boundsAnimation, forKey: "bounds")
        layer.add(positionAnimation, forKey: "position")
        CATransaction.commit()
    }

    public func getParentViewController() -> UIViewController? {
        for view in sequence(first: superview, next: { view in
            view?.superview
        }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self) {
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
}
