//
//  TMPopUpViewCell.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/15.
//

import Foundation
import UIKit

class TMPopUpViewCell: UITableViewCell {
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
