//
//  TMImageView.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/3/24.
//

import Foundation
import UIKit

open class TMImageViewConfig {
    // 图像
    public var image: Data
    // 图像显示模式
    public var contentMode: UIView.ContentMode
    
    public init(image: Data, contentMode: UIView.ContentMode) {
        self.image = image
        self.contentMode = contentMode
    }
}
