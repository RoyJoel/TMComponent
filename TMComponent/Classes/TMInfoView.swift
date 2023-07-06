//
//  TMInfoView.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/3/24.
//

import Foundation

open class TMInfoView: TMScalableView {
    /// 标题标签
    private lazy var infoTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    /// 内容标签
    private lazy var infoContentLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(infoContentLabel)
        addSubview(infoTitleLabel)

        infoTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        infoContentLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        backgroundColor = UIColor(named: "ComponentBackground")
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupEvent(config: TMInfoViewConfig) {
        infoContentLabel.text = config.infoContent
        infoContentLabel.font = config.infoContentFont
        infoTitleLabel.text = config.infoTitle
        infoTitleLabel.font = config.infoTitleFont
        
        infoTitleLabel.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(config.inset)
        }
        infoContentLabel.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-config.inset)
        }
    }

    public func updateInfo(with newText: String) {
        infoContentLabel.text = newText
    }
}
