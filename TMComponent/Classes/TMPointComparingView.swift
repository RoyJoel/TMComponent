//
//  TMVSView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation
import UIKit

/// TM双方得分视图，使用时仅需设置宽度
open class TMPointComparingView: TMScalableView {
    /// 标题标签
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    /// 左侧基础分数视图
    private lazy var leftPointView: TMBasicPointView = {
        let pointView = TMBasicPointView()
        return pointView
    }()
    /// 右侧基础分数视图
    private lazy var rightPointView: TMBasicPointView = {
        let pointView = TMBasicPointView()
        return pointView
    }()

    public func updateLeftViewData(isServingOnLeft: Bool, newNum: String) {
        leftPointView.updateView(isServing: isServingOnLeft, newText: newNum)
    }

    public func updateRightViewData(isServingOnRight: Bool, newNum: String) {
        rightPointView.updateView(isServing: isServingOnRight, newText: newNum)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(leftPointView)
        addSubview(rightPointView)

        leftPointView.snp.makeConstraints { make in
            make.left.equalToSuperview()
        }
        rightPointView.snp.makeConstraints { make in
            make.right.equalToSuperview()
        }

        titleLabel.isHidden = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupEvent(config: TMPointComparingViewConfig) {
        titleLabel.font = config.font

        if config.isComparing {
            if config.areBothServing {
                leftPointView.setupEvent(config: TMBasicPointViewConfig(isLeft: true, iconName: config.iconName, isServing: true, text: config.leftText, font: config.font))
                rightPointView.setupEvent(config: TMBasicPointViewConfig(isLeft: false, iconName: config.iconName, isServing: true, text: config.rightText, font: config.font))
            } else {
                leftPointView.setupEvent(config: TMBasicPointViewConfig(isLeft: true, iconName: config.iconName, isServing: config.isServingOnLeft, text: config.leftText, font: config.font))
                rightPointView.setupEvent(config: TMBasicPointViewConfig(isLeft: false, iconName: config.iconName, isServing: !config.isServingOnLeft, text: config.rightText, font: config.font))
            }
        } else {
            leftPointView.setupEvent(config: TMBasicPointViewConfig(isLeft: true, iconName: config.iconName, isServing: false, text: config.leftText, font: config.font))
            rightPointView.setupEvent(config: TMBasicPointViewConfig(isLeft: false, iconName: config.iconName, isServing: false, text: config.rightText, font: config.font))
        }

        let label = UILabel()
        label.text = "height estimation"
        label.font = config.font
        label.sizeToFit()
        let TMBPViewHeight = label.bounds.size.height
        if config.title != nil {
            if !config.isTitleHidden {
                titleLabel.text = config.title
                titleLabel.isHidden = false

                if config.isTitleLabelAbovePointView {
                    titleLabel.snp.remakeConstraints { make in
                        make.top.equalToSuperview()
                        make.centerX.equalToSuperview()
                    }
                    leftPointView.snp.remakeConstraints { make in
                        make.left.equalToSuperview()
                        make.bottom.equalToSuperview()
                        make.height.equalTo(TMBPViewHeight)
                    }
                    rightPointView.snp.remakeConstraints { make in
                        make.right.equalToSuperview()
                        make.bottom.equalToSuperview()
                        make.height.equalTo(TMBPViewHeight)
                    }
                } else {
                    titleLabel.snp.remakeConstraints { make in
                        make.centerX.equalToSuperview()
                        make.centerY.equalToSuperview()
                    }
                    leftPointView.snp.remakeConstraints { make in
                        make.left.equalToSuperview()
                        make.centerY.equalToSuperview()
                        make.height.equalTo(TMBPViewHeight)
                    }
                    rightPointView.snp.remakeConstraints { make in
                        make.right.equalToSuperview()
                        make.centerY.equalToSuperview()
                        make.height.equalTo(TMBPViewHeight)
                    }
                }
            } else {
                titleLabel.isHidden = true

                leftPointView.snp.remakeConstraints { make in
                    make.left.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.height.equalTo(TMBPViewHeight)
                }
                rightPointView.snp.remakeConstraints { make in
                    make.right.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.height.equalTo(TMBPViewHeight)
                }
            }
        } else {
            titleLabel.isHidden = true

            leftPointView.snp.remakeConstraints { make in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(TMBPViewHeight)
            }
            rightPointView.snp.remakeConstraints { make in
                make.right.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(TMBPViewHeight)
            }
        }
    }
}
