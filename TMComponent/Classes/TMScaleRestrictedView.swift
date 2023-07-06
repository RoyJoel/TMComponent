//
//  TMScaleRestrictedView.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation
import UIKit

/// 放大后不可缩小的TMScalableView，用于处理手势冲突
class TMScaleRestrictedView: TMScalableView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        let tmview = view as? TMScalableView

        if let tmview = tmview {
            if tmview.toggle == false {
                return tmview
            } else {
                if tmview == self {
                    return nil
                }
                return view
            }
        }
        return super.hitTest(point, with: event)
    }
}
