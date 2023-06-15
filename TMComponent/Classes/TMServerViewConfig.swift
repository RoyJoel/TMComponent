//
//  TMServerViewConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/15.
//

import Foundation

open class TMServerViewConfig {
    public var selectedImage: String
    public var unSelectedImage: String
    public var selectedTitle: String
    public var unselectedTitle: String

    public init(selectedImage: String, unSelectedImage: String, selectedTitle: String, unselectedTitle: String) {
        self.selectedImage = selectedImage
        self.unSelectedImage = unSelectedImage
        self.selectedTitle = selectedTitle
        self.unselectedTitle = unselectedTitle
    }
}
