//
//  File.swift
//  TMComponents
//
//  Created by Jason Zhang on 2023/2/21.
//

import Foundation
import UIKit
import TMComponent

open class TMInfoViewController: UIViewController {
    lazy var oView: TMInfoView = {
        let view = TMInfoView()
        return view
    }()
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let config = TMInfoViewConfig(icon: "JasonZhang", name: "张嘉诚")
        oView.setup(with: config)
        view.addSubview(oView)
        oView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
        }
    }
}
