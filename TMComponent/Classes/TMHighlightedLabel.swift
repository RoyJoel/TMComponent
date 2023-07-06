//
//  TMHighlightedLabel.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation

/// 带有主题风格的UILabel
class TMHighlightedLabel: TMBasicLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "TennisBlur")
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
