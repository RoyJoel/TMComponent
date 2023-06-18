//
//  TMPopUpViewCell.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2023/3/15.
//

import Foundation
import UIKit

open class TMPopUpCell: UITableViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        label.backgroundColor = UIColor(named: "BackgroundGray")
        label.textAlignment = .center
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setupEvent(title: String) {
        label.text = title
    }
}

