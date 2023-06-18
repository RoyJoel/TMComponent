//
//  TMButton.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/2/17.
//

import Foundation
import UIKit

open class TMButton: UIButton {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(named: "ContentBackground"), for: .normal)
        setTitleColor(UIColor(named: "TennisBlur"), for: .selected)
        backgroundColor = UIColor(named: "ComponentBackground")
        titleLabel?.numberOfLines = 2
        titleLabel?.textAlignment = .center
        setCorner(radii: 15)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupEvent(config: TMButtonConfig) {
        setTitle(config.title, for: .normal)
        addTapGesture(config.actionTarget, config.action)
    }
}
