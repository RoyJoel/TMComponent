//
//  tableViewCell.swift
//  TMComponents
//
//  Created by Jason Zhang on 2023/2/21.
//

import Foundation
import UIKit

class TMTableViewCell: UITableViewCell {
    var name: String?
    
    lazy var titleView: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        titleView.text = name
        addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
