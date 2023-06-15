//
//  TMTextfield.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/15.
//
import Foundation
import UIKit

open class TMTextField: UIView, UITextFieldDelegate {
    public lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 22)
        return textField
    }()

    public func setup(with config: TMTextFieldConfig) {
        setupUI()
        setupEvent(config: config)
    }

    public func updateText(_ text: String) {
        textField.text = text
    }

    public func setupUI() {
        backgroundColor = UIColor(named: "TennisBlurTextField")
        setCorner(radii: 15)

        addSubview(textField)

        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().offset(-20)
        }
    }

    public func setupEvent(config: TMTextFieldConfig) {
        textField.placeholder = config.placeholderText
        textField.text = config.text
    }
}
