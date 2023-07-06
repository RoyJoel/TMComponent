//
//  TMTextfield.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/15.
//
import Foundation
import UIKit

open class TMTextField: UIView {
    
    public lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 22)
        return textField
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "TennisBlurTextField")
        setCorner(radii: 15)

        addSubview(textField)

        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().offset(-20)
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 目前没有想到更好的配置方案，所以暂时不做配置项，直接对textfield作修改
//    public func setupEvent(config: TMTextFieldConfig) {
//        textField.placeholder = config.placeholderText
//    }
//
//    public func setText(_ text: String) {
//        textField.text = text
//    }
//
//    public func getText() -> String? {
//        textField.text
//    }
}
