//
//  TMPopUpView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/15.
//

import Foundation
import UIKit

open class TMPopUpView: TMTableView {
    public override func setupUI() {
        delegate = self
        setCorner(radii: 8)
        super.setupUI()
    }

    public override func setupEvent(config: TMTableViewConfig) {
        self.config = config
        setupSize()
        super.setupEvent(config: config)
    }

    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if toggle == false {
            unfold()
        } else {
            UIView.performWithoutAnimation {
                moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            }
            let cell = config.cells[indexPath.row]
            config.cells.remove(at: indexPath.row)
            config.cells.insert(cell, at: 0)
            fold()
        }
    }

    public func setupSize() {
        var scaledNum: CGFloat = 0
        var scaledHeight: CGFloat = 0
        if config.cells.count >= 4 {
            scaledNum = 4
            scaledHeight = layer.position.y + 1.5 * bounds.height
        } else {
            scaledNum = CGFloat(config.cells.count)
            scaledHeight = layer.position.y + CGFloat(config.cells.count - 1) * 0.5 * bounds.height
        }
        setup(bounds, layer.position, CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height * scaledNum), CGPoint(x: layer.position.x, y: scaledHeight), 0.3)
    }
}

open class TMPopUpViewConfig: TMTableViewConfig {
    public override init(cells: [UITableViewCell], rowHeight: CGFloat, rowNumWhenFold: Int = 1, rowNumWhenUnfold: Int = 4) {
        super.init(cells: cells, rowHeight: rowHeight, rowNumWhenFold: rowNumWhenFold, rowNumWhenUnfold: rowNumWhenUnfold)
        self.cells = cells
        self.rowHeight = rowHeight
    }
}
