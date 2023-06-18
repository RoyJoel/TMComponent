//
//  TMBasicPointView.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation
import UIKit

/// TM基础分数视图
open class TMBasicPointView: TMView {
    /// 高亮图片，为后面的集成比分使用
    private lazy var highLightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.setCorner(radii: 10)
        return imageView
    }()
    /// 比分标签
    private lazy var pointLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(highLightImage)
        addSubview(pointLabel)
        
        highLightImage.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalTo(pointLabel.snp.centerY)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        pointLabel.snp.makeConstraints { make in
            make.left.equalTo(highLightImage.snp.right).offset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 更新高亮状态和文字
    public func updateView(isServing: Bool, newText: String) {
        if !isServing {
            highLightImage.isHidden = true
        } else {
            highLightImage.isHidden = false
        }
        
        pointLabel.text = newText
    }

    public func setupEvent(config: TMBasicPointViewConfig) {
        if let iconImage = config.iconName {
            highLightImage.image = UIImage(named: iconImage)
            highLightImage.isHidden = false
        }else {
            highLightImage.isHidden = true
        }
        
        if !config.isServing {
            highLightImage.isHidden = true
            if !config.isLeft {
                pointLabel.snp.remakeConstraints { make in
                    make.right.equalToSuperview().offset(-28)
                    make.centerY.equalToSuperview()
                }
            } else {
                pointLabel.snp.remakeConstraints { make in
                    make.left.equalToSuperview().offset(28)
                    make.centerY.equalToSuperview()
                }
            }
        } else {
            highLightImage.isHidden = false
            if !config.isLeft {
                highLightImage.snp.remakeConstraints { make in
                    make.centerY.equalTo(pointLabel.snp.centerY)
                    make.right.equalToSuperview()
                    make.width.equalTo(20)
                    make.height.equalTo(20)
                }
                pointLabel.snp.remakeConstraints { make in
                    make.right.equalTo(highLightImage.snp.left).offset(-8)
                    make.centerY.equalToSuperview()
                }
            } else {
                highLightImage.snp.remakeConstraints { make in
                    make.centerY.equalTo(pointLabel.snp.centerY)
                    make.left.equalToSuperview()
                    make.width.equalTo(20)
                    make.height.equalTo(20)
                }
                pointLabel.snp.remakeConstraints { make in
                    make.left.equalTo(highLightImage.snp.right).offset(8)
                    make.centerY.equalToSuperview()
                }
            }
        }
        
        pointLabel.text = config.text
        pointLabel.font = config.font
    }
}
