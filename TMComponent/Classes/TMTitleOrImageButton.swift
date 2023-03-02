//
//  TMTitleOrImageButton.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/3/2.
//

import Foundation
import UIKit

class TMTitleOrImageButton: UIButton {
    var config = TMTitleOrImageButtonConfig(action: #selector(method), actionTarget: TMTitleOrImageButton.self)
    
    lazy var optionalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setCorner(radii: 15)
        return imageView
    }()
    
    lazy var optionalTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func setUp(with config: TMTitleOrImageButtonConfig) {
        setupUI()
        setupEvent(config: config)
    }

    func setupUI() {
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        setCorner(radii: 15)
        drawBorder(color: .black, width: 2)
        
        addSubview(optionalImageView)
        addSubview(optionalTitleLabel)
        
        optionalTitleLabel.numberOfLines = 1
        optionalTitleLabel.textAlignment = .center
        
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
        optionalImageView.isHidden = true
        optionalTitleLabel.isHidden = true
    }

    func setupEvent(config: TMTitleOrImageButtonConfig) {
        self.config = config
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
        }else {
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
            }else {
                optionalTitleLabel.isHidden = true
            }
        }
    }
}
