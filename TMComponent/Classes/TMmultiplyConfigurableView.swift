//
//  TMLabel.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation
import UIKit

/// TM可配置多条比分视图
open class TMmultiplyConfigurableView: TMView {
    /// 配备的比分视图数组
    var vsViews: [TMPointComparingView] = []
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func reset(with config: TMmultiplyConfigurableViewConfig) {
        lazy var view: TMPointComparingView = {
            let label = TMPointComparingView()
            return label
        }()
        var lastView = view
        view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(config.rowHeight)
        }
        view.setupEvent(config: config.configs[0])
        for i in 1 ..< vsViews.count {
            vsViews[i].setupEvent(config: config.configs[i])
            vsViews[i].snp.remakeConstraints { make in
                make.top.equalTo(lastView.snp.bottom).offset(config.rowSpacing)
                make.width.equalToSuperview()
                make.height.equalTo(config.rowHeight)
            }
            lastView = vsViews[i]
        }
    }

    public func updateLeftDate(at index: Int, isServingOnLeft: Bool, newNum: String) {
        vsViews[index].updateLeftViewData(isServingOnLeft: isServingOnLeft, newNum: newNum)
    }

    public func updateRightDate(at index: Int, isServingOnRight: Bool, newNum: String) {
        vsViews[index].updateRightViewData(isServingOnRight: isServingOnRight, newNum: newNum)
    }

    public func setupEvent(config: TMmultiplyConfigurableViewConfig) {
        lazy var view: TMPointComparingView = {
            let label = TMPointComparingView()
            return label
        }()
        var lastView = view
        vsViews.append(view)
        view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(config.rowHeight)
        }
        view.setupEvent(config: config.configs[0])
        for i in 1 ..< config.configs.count {
            lazy var nextView: TMPointComparingView = {
                let label = TMPointComparingView()
                return label
            }()
            nextView.setupEvent(config: config.configs[i])
            addSubview(nextView)
            nextView.snp.makeConstraints { make in
                make.top.equalTo(lastView.snp.bottom).offset(config.rowSpacing)
                make.width.equalToSuperview()
                make.height.equalTo(config.rowHeight)
            }
            lastView = nextView
            vsViews.append(nextView)
        }
    }
}
