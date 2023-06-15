//
//  TMTextfiledConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/15.
//
import Foundation

open class TMTextFieldConfig {
    public var placeholderText: String
    public var text: String?
    
    public init(placeholderText: String, text: String? = nil) {
        self.placeholderText = placeholderText
        self.text = text
    }
}
