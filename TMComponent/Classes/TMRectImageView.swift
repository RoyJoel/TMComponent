//
//  TMImageView.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/3/24.
//

import Foundation
import UIKit

open class TMRectImageView: UIImageView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCorner(radii: 15)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupEvent(config: TMImageViewConfig) {
        image = UIImage(data: config.image)
        contentMode = config.contentMode
    }
}
