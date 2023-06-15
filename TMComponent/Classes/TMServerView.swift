//
//  TMServerView.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/15.
//

import Foundation
import UIKit

open class TMServerView: TMView {
    var config = TMServerViewConfig(selectedImage: "", unSelectedImage: "", selectedTitle: "", unselectedTitle: "")
    lazy var selectionView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var textLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    public func setup(isServing: Bool, config: TMServerViewConfig) {
        self.config = config
        addSubview(selectionView)
        addSubview(textLabel)

        selectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(selectionView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }

        textLabel.textAlignment = .center
        selectionView.isUserInteractionEnabled = true
        textLabel.isUserInteractionEnabled = true
        if isServing {
            selectionView.image = UIImage(systemName: config.selectedImage)?.withTintColor(UIColor(named: "Tennis") ?? .black, renderingMode: .alwaysOriginal)
            textLabel.text = NSLocalizedString(config.selectedTitle, comment: "")
        } else {
            selectionView.image = UIImage(systemName: config.unSelectedImage)?.withTintColor(UIColor(named: "Tennis") ?? .black, renderingMode: .alwaysOriginal)
            textLabel.text = NSLocalizedString(config.unselectedTitle, comment: "")
        }
    }

    public func changeStats(to isSelected: Bool) {
        if isSelected {
            selectionView.image = UIImage(systemName: config.selectedImage)?.withTintColor(UIColor(named: "Tennis") ?? .black, renderingMode: .alwaysOriginal)
            textLabel.text = NSLocalizedString(config.selectedTitle, comment: "")
        } else {
            selectionView.image = UIImage(systemName: config.unSelectedImage)?.withTintColor(UIColor(named: "Tennis") ?? .black, renderingMode: .alwaysOriginal)
            textLabel.text = NSLocalizedString(config.unselectedTitle, comment: "")
        }
    }
}
