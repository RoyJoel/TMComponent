//
//  HomeBasicInfoViewConfig.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2022/12/27.
//

import Foundation

open class TMIconViewConfig {
    /// 头像数据
    public var icon: Data
    /// 昵称
    public var name: String
    
    public init(icon: Data, name: String) {
        self.icon = icon
        self.name = name
    }
}
