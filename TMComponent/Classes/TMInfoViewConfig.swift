//
//  HomeBasicInfoViewConfig.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2022/12/27.
//

import Foundation

open class TMInfoViewConfig {
    public var iconName: String?
    public var name: String
    public init(iconName: String?, name: String) {
        self.iconName = iconName
        self.name = name
    }
}
