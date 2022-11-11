//
//  AlertViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/10.
//

import Foundation
import UIKit

class AlertViewController: UIView {
    private lazy var titleLabel = UILabel().then {
        $0.text = "변경한 내용을 저장하지 않고 나만의 메뉴 목록으로 돌아가시겠습니까?"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.numberOfLines = 2
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    lazy var cancelBtn = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(UIColor(r: 47, g: 134, b: 80), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(r: 47, g: 134, b: 80).cgColor
        $0.layer.cornerRadius = 18
    }
    
    lazy var okBtn = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(r: 47, g: 134, b: 80)
        $0.layer.cornerRadius = 18
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - extension
extension AlertViewController {
    private func setupView() {
        addSubviews([titleLabel,
                    cancelBtn, okBtn])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        cancelBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(25)
            $0.trailing.equalTo(okBtn.snp.leading).offset(-15)
            $0.width.equalTo(80)
            $0.height.equalTo(35)
        }
        
        okBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(80)
            $0.height.equalTo(35)
        }
    }
}
