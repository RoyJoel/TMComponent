//
//  TMPopUpView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/15.
//

import Foundation
import UIKit

open class TMPopUpView: TMTableView {
    public var selectedCell: UITableViewCell?
    
    public override func setupUI() {
        delegate = self
        setCorner(radii: 8)
        super.setupUI()
        setupSize()
    }

    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if toggle == false {
            unfold()
        } else {
            UIView.performWithoutAnimation {
                moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            }
            let cell = TMDataSource?.tableView(cellForRowAt: indexPath)
            selectedCell = cell
            fold()
        }
    }

    public func setupSize() {
        var scaledNum: CGFloat = 0
        var scaledHeight: CGFloat = 0
        if TMDataSource?.tableView(numberOfRowsInSection: 0) ?? 0 >= 4 {
            scaledNum = 4
            scaledHeight = layer.position.y + 1.5 * bounds.height
        } else {
            scaledNum = CGFloat(TMDataSource?.tableView(numberOfRowsInSection: 0) ?? 0)
            scaledHeight = layer.position.y + CGFloat(TMDataSource?.tableView(numberOfRowsInSection: 0) ?? 0 - 1) * 0.5 * bounds.height
        }
        setup(bounds, layer.position, CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height * scaledNum), CGPoint(x: layer.position.x, y: scaledHeight), 0.3)
    }
}
