//
//  TMTableView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/16.
//

import Foundation
import UIKit

public protocol TMTableViewDataSource: NSObjectProtocol {
    func tableView(cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(numberOfRowsInSection section: Int) -> Int
}

open class TMTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    public var originalBounds: CGRect = .init()

    public var originalPoint: CGPoint = .init()

    public var newBounds: CGRect = .init()

    public var newPoint: CGPoint = .init()

    public var scaleTimes: CGFloat = .init()

    public var duration: CFTimeInterval = 0

    public var toggle: Bool = false
    
    weak public var TMDataSource: TMTableViewDataSource?

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
        register(TMPopUpCell.self, forCellReuseIdentifier: "TMPopUpCell")
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

    public func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        TMDataSource?.tableView(numberOfRowsInSection: section) ?? 0
    }

    public func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        TMDataSource?.tableView(heightForRowAt: indexPath) ?? 0
    }

    public func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        TMDataSource?.tableView(cellForRowAt: indexPath) ?? UITableViewCell()
    }
}

