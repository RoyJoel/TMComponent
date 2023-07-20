//
//  TMBasicButton.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation

/// 基础圆角UILabel
open class TMBasicButton: UIView {
    
    internal lazy var button: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setCorner(radii: 10)
        button.setTitleColor(UIColor(named: "ContentBackground"), for: .normal)
        backgroundColor = UIColor(named: "ComponentBackground")
        
        addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupEvent(config: TMButtonConfig) {
        button.addTapGesture(config.actionTarget, config.action)

        if let image = config.image {
            button.setImage(image, for: .normal)
        } else {
            button.setImage(nil, for: .normal)
            if let title = config.title {
                button.setTitle(title, for: .normal)
            } else {
                button.setTitle(nil, for: .normal)
            }
        }
    }
}
