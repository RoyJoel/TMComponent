//
//  BasinessComponent.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2022/12/27.
//

import Foundation
import SnapKit
import UIKit

/// 基本信息视图，使用时需设置宽高，图片大小将随之变化
open class TMIconView: TMView {
    /// 头像视图
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.setCorner(radii: 15)
        imageView.drawBorder(color: .white, width: 5)
        return imageView
    }()
    /// 昵称标签
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconImage)
        addSubview(nameLabel)

        iconImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalTo(nameLabel.snp.top).offset(-8)
        }
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(20)
            make.centerX.equalTo(self.iconImage.snp.centerX)
        }
        
        nameLabel.isHidden = false
        iconImage.contentMode = .scaleAspectFill
        iconImage.isUserInteractionEnabled = true
        nameLabel.isUserInteractionEnabled = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   public func setupEvent(config: TMIconViewConfig) {
        iconImage.image = UIImage(data: config.icon)
       
        if config.name == "" {
            nameLabel.isHidden = true
        } else {
            nameLabel.isHidden = false
            nameLabel.text = config.name
        }
    }

    /// 更新头像、昵称
    public func updateInfo(with icon: Data, named name: String) {
        iconImage.image = UIImage(data: icon)
        
        if name == "" {
            nameLabel.isHidden = true
        } else {
            nameLabel.isHidden = false
            nameLabel.text = name
        }
    }
}
