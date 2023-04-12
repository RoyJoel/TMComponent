//
//  TMPointRecordViewController.swift
//  TMComponents
//
//  Created by Jason Zhang on 2023/2/21.
//

import Foundation
import UIKit
import TMComponent

class TMPointRecordViewController: UIViewController {
    lazy var oView: TMmultiplyConfigurableView = {
        let view = TMmultiplyConfigurableView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let config1 = TMPointComparingViewConfig(isTitleViewAbovePointView: true, isTitleHidden: false, title: "标题在上，左侧发球", iconName: "Jason Zhang", isServingOnLeft: true, areBothServing: false, isComparing: true, font: UIFont.systemFont(ofSize: 20), leftNum: "100", rightNum: "100")
        let config2 = TMPointComparingViewConfig(isTitleViewAbovePointView: true, isTitleHidden: false, title: "标题在上，右侧发球", iconName: "Jason Zhang", isServingOnLeft: false, areBothServing: false, isComparing: true, font: UIFont.systemFont(ofSize: 20), leftNum: "100", rightNum: "100")
        let config3 = TMPointComparingViewConfig(isTitleViewAbovePointView: false, isTitleHidden: false, title: "标题在中，左侧发球", iconName: "Jason Zhang", isServingOnLeft: true, areBothServing: false, isComparing: true, font: UIFont.systemFont(ofSize: 20), leftNum: "100", rightNum: "100")
        let config4 = TMPointComparingViewConfig(isTitleViewAbovePointView: false, isTitleHidden: false, title: "标题在中，右侧发球", iconName: "Jason Zhang", isServingOnLeft: false, areBothServing: false, isComparing: true, font: UIFont.systemFont(ofSize: 20), leftNum: "100", rightNum: "100")
        let configs = [config1, config2, config3, config4]
        
        let config = TMmultiplyConfigurableViewConfig(rowHeight: 50, rowSpacing: 10, configs: configs)
        
        oView.setup(with: config)
        
        view.addSubview(oView)
        
        oView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(230)
        }
    }
}
