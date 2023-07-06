//
//  TMBasicLabel.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation

/// 基础圆角UILabel
open class TMBasicLabel: UILabel {
    internal lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setCorner(radii: 10)
        backgroundColor = UIColor(named: "ComponentBackground")
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupEvent(config: TMLabelConfig) {
        label.text = config.title
        label.font = config.font
    }
}
