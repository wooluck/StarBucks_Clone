//
//  OrderTableViewCell.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/08.
//

import Foundation
import UIKit

class AllMenuTableViewCell: UITableViewCell {
    static let id = "AllMenuTableViewCell"
    
    lazy var menuImage = UIImageView().then {
        $0.image = UIImage(named: "recommend")
    }
    
    lazy var kindKRLabel = UILabel().then {
        $0.text = "추천"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    lazy var kindENGLabel = UILabel().then {
        $0.text = "Recommend"
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    
    // MARK: - init()
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            setupLayout()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension AllMenuTableViewCell {
    private func setupLayout() {
        addSubviews([menuImage, kindKRLabel, kindENGLabel])
        
        menuImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(70)
            $0.bottom.equalToSuperview()
        }
        
        kindKRLabel.snp.makeConstraints {
            $0.top.equalTo(menuImage.snp.top).offset(10)
            $0.leading.equalTo(menuImage.snp.trailing).offset(20)
        }
        
        kindENGLabel.snp.makeConstraints {
            $0.top.equalTo(kindKRLabel.snp.bottom).offset(10)
            $0.leading.equalTo(menuImage.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
    }
}
