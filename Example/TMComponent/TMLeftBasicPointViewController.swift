//
//  TMBasicPointView.swift
//  TMComponents
//
//  Created by Jason Zhang on 2023/2/21.
//

import Foundation
import UIKit
import SnapKit
import TMComponent

class TMLeftBasicPointViewController: UIViewController {
    lazy var oView: TMBasicPointView = {
        let view = TMBasicPointView()
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let config = TMBasicPointViewConfig(isLeft: true, iconName: "Jason Zhang", isServing: true, text: "100", font: UIFont.systemFont(ofSize: 20))
        oView.setupEvent(config: config)
        
        view.addSubview(oView)
        
        oView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
    }
}
