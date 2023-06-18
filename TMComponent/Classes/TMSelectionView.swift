//
//  TMSelectionView.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/15.
//

import Foundation
import UIKit
open class TMSelectionView: UIView {
    /// 是否在左侧
    public var isLeft: Bool = true
    /// 左侧选项
    private lazy var leftServerView: TMServerView = {
        let serveView = TMServerView()
        return serveView
    }()
    /// 右侧选项
    private lazy var rightServerView: TMServerView = {
        let serveView = TMServerView()
        return serveView
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(leftServerView)
        addSubview(rightServerView)
        
        leftServerView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        rightServerView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        
        leftServerView.addTapGesture(self, #selector(changeServe))
        rightServerView.addTapGesture(self, #selector(changeServe))
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupEvent(config: TMServerViewConfig) {
        leftServerView.setupEvent(isServing: isLeft, config: TMServerViewConfig(selectedImage: config.selectedImage, unSelectedImage: config.unSelectedImage, selectedTitle: config.selectedTitle, unselectedTitle: config.selectedTitle))
        rightServerView.setupEvent(isServing: !isLeft, config: TMServerViewConfig(selectedImage: config.selectedImage, unSelectedImage: config.unSelectedImage, selectedTitle: config.unselectedTitle, unselectedTitle: config.unselectedTitle))
    }

    @objc private func changeServe() {
        isLeft.toggle()
        leftServerView.changeStats(to: isLeft)
        rightServerView.changeStats(to: !isLeft)
    }
}
