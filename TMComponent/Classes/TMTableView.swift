//
//  TMTableView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/16.
//

import Foundation
import UIKit

open class TMTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var config: TMTableViewConfig = TMTableViewConfig(cells: [], rowHeight: 0, rowNumWhenFold: 0, rowNumWhenUnfold: 0)
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

    public func setupUI() {
        dataSource = self
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        isScrollEnabled = false
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
            UITableView.appearance().isPrefetchingEnabled = false
        }
        register(TMPopUpViewCell.self, forCellReuseIdentifier: "TMPopUpViewCell")
    }

    public func setupEvent(config: TMTableViewConfig) {
        self.config = config
        reloadData()
    }

    open func unfold() {
        isScrollEnabled = true
        toggle = true
        addAnimation(originalPoint, newPoint, duration, "position", completionHandler: {})
        addAnimation(originalBounds, newBounds, duration, "bounds", completionHandler: {})
        bounds = newBounds
        layer.position = newPoint
    }

    open func fold() {
        isScrollEnabled = false
        toggle = false
        addAnimation(newBounds, originalBounds, duration, "bounds", completionHandler: {})
        addAnimation(newPoint, originalPoint, duration, "position", completionHandler: {})
        bounds = originalBounds
        layer.position = originalPoint
    }

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        if toggle == false {
            return config.rowNumWhenFold
        } else {
            return config.cells.count
        }
    }

    public func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return config.rowHeight
    }

    public func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = config.cells[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

open class TMTableViewConfig {
    public var cells: [UITableViewCell]
    public var rowHeight: CGFloat
    public var rowNumWhenFold: Int
    public var rowNumWhenUnfold: Int
    public init(cells: [UITableViewCell], rowHeight: CGFloat, rowNumWhenFold: Int, rowNumWhenUnfold: Int) {
        self.cells = cells
        self.rowHeight = rowHeight
        self.rowNumWhenFold = rowNumWhenFold
        self.rowNumWhenUnfold = rowNumWhenUnfold
    }
}
