//
//  TMTitleViewWithVSViewController.swift
//  TMComponents
//
//  Created by Jason Zhang on 2023/2/21.
//

import Foundation
import UIKit
import TMComponent

class TMTitleViewWithVSViewController: UIViewController {
    lazy var oView: TMPointComparingView = {
        let view = TMPointComparingView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let config = TMPointComparingViewConfig(isTitleLabelAbovePointView: false, isTitleHidden: false, title: "标题在中", iconName: "Jason Zhang", isServingOnLeft: true, areBothServing: false, isComparing: true, font: UIFont.systemFont(ofSize: 20), leftText: "100", rightText: "100")
        oView.setupEvent(config: config)
        
        view.addSubview(oView)
        
        oView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            
        }
    }
}
