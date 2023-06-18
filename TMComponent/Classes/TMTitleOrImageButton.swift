//
//  TMTitleOrImageButton.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/3/2.
//

import Foundation
import UIKit

/// 有图片时仅显示图片，无图片时显示文字
open class TMTitleOrImageButton: UIButton {
    /// 可选的图片视图
    private lazy var optionalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setCorner(radii: 15)
        return imageView
    }()
    /// 可选的标题标签
    private lazy var optionalTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(named: "ContentBackground"), for: .normal)
        setTitleColor(UIColor(named: "TennisBlur"), for: .selected)
        backgroundColor = UIColor(named: "ComponentBackground")
        titleLabel?.numberOfLines = 2
        titleLabel?.textAlignment = .center
        setCorner(radii: 15)

        addSubview(optionalImageView)
        addSubview(optionalTitleLabel)

        optionalImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-12)
            make.height.equalTo(30)
        }
        optionalTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(30)
        }
        
        optionalTitleLabel.numberOfLines = 1
        optionalTitleLabel.textAlignment = .center
        optionalImageView.isHidden = true
        optionalTitleLabel.isHidden = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupEvent(config: TMTitleOrImageButtonConfig) {
        addTapGesture(config.actionTarget, config.action)

        if let image = config.image {
            optionalImageView.isHidden = false
            optionalTitleLabel.isHidden = true

            optionalImageView.image = image

            optionalImageView.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalTo(bounds.width * 0.6)
                make.height.equalTo(bounds.height * 0.6)
            }
        } else {
            optionalImageView.isHidden = true
            
            if let title = config.title {
                optionalTitleLabel.isHidden = false

                optionalTitleLabel.text = title

                optionalTitleLabel.snp.remakeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalTo(bounds.width * 0.6)
                    make.height.equalTo(bounds.height * 0.6)
                }
            } else {
                optionalTitleLabel.isHidden = true
            }
        }
    }
}
