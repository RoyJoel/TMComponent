//
//  TMPopUpViewController.swift
//  TMComponent_Example
//
//  Created by Jason Zhang on 2023/3/26.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import TMComponent

class TMPopUpViewController: UIViewController, UITableViewDataSource {
    
    lazy var oView: TMPopUpView = {
        let view = TMPopUpView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        oView.dataSource = self
        
        view.addSubview(oView)
        
        oView.frame = CGRect(x: 12, y: 12, width: 300, height: 30)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TMPopUpCustomCell()
        cell.setupUI()
        cell.setupEvent(title: "fasdfasfasdf")
        return cell
    }
    
    
}

class TMPopUpCustomCell: UITableViewCell{
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    func setupUI() {
        addSubview(label)
        label.backgroundColor = UIColor(named: "ComponentBackground")
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        label.textAlignment = .center
    }
    
    func setupEvent(title: String) {
        label.text = title
    }

}
