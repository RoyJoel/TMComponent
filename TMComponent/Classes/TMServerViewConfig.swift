//
//  TMServerViewConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/15.
//

import Foundation

open class TMServerViewConfig {
    /// 选中时图片
    public var selectedImage: String
    /// 未选中时图片
    public var unSelectedImage: String
    /// 选中时标题
    public var selectedTitle: String
    /// 未选中时标题
    public var unselectedTitle: String

    public init(selectedImage: String, unSelectedImage: String, selectedTitle: String, unselectedTitle: String) {
        self.selectedImage = selectedImage
        self.unSelectedImage = unSelectedImage
        self.selectedTitle = selectedTitle
        self.unselectedTitle = unselectedTitle
    }
}
