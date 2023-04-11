//
//  TMPopUpView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/15.
//

import Foundation
import UIKit



open class TMPopUpView: TMTableView, UITableViewDelegate {
    
    public var selectedIndex: IndexPath?
    
    public var selectedCompletionHandler: (() -> Void)?
    
    public override func setupUI() {
        setCorner(radii: 8)
        super.setupUI()
        setupSize()
    }

    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if toggle == false {
            unfold()
            reloadData()
        } else {
            selectedIndex = indexPath
            setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            UIView.performWithoutAnimation {
                moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            }
            deselectRow(at: IndexPath(row: 0, section: 0), animated: false)
            (selectedCompletionHandler ?? {})()
            fold()
        }
    }

    public func setupSize() {
        var scaledNum: CGFloat = 0
        var scaledHeight: CGFloat = 0
        if numberOfRows(inSection: 0) >= 4 {
            scaledNum = 4
            scaledHeight = layer.position.y + 1.5 * bounds.height
        } else {
            scaledNum = CGFloat(numberOfRows(inSection: 0))
            scaledHeight = layer.position.y + CGFloat(numberOfRows(inSection: 0) - 1) * 0.5 * bounds.height
        }
        setup(bounds, layer.position, CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height * scaledNum), CGPoint(x: layer.position.x, y: scaledHeight), 0.3)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        originalBounds.height
    }
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !self.point(inside: point, with: nil), toggle == true {
            fold()
        }
        return super.hitTest(point, with: event)
    }
}
