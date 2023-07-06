//
//  TMHighlightedButton.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation

/// 带有主题风格的UIButton
open class TMHighlightedButton: TMBasicButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "TennisBlur")
        button.setTitleColor(UIColor(named: "ContentBackground"), for: .normal)
        button.setTitleColor(UIColor(named: "TennisBlur"), for: .selected)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
