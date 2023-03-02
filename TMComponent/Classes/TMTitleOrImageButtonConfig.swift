//
//  TMTitleOrImageButtonConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/3/2.
//

import Foundation
class TMTitleOrImageButtonConfig {
    var image: UIImage?
    var title: String?
    var action: Selector
    var actionTarget: Any

    init(image: UIImage? = nil, title: String? = nil, action: Selector, actionTarget: Any) {
        self.image = image
        self.title = title
        self.action = action
        self.actionTarget = actionTarget
    }
}
