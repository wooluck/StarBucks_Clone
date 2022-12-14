//
//  MenuListTableViewCell.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/09.
//

import Foundation
import UIKit

class MenuListTableViewCell: UITableViewCell {
    
    private lazy var menuImage = UIImageView().then {
        $0.image = UIImage(named: "recommend")
    }
    
    private lazy var kindKRLabel = UILabel().then {
        $0.text = "추천"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private lazy var kindENGLabel = UILabel().then {
        $0.text = "Recommend"
        $0.font = .systemFont(ofSize: 15, weight: .light)
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "5,900원"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    // MARK: - init()
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            setupLayout()
            backgroundColor = .red
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension MenuListTableViewCell {
    private func setupLayout() {
        addSubviews([menuImage,
                     kindKRLabel,
                     kindENGLabel,
                     priceLabel])
        
        menuImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        kindKRLabel.snp.makeConstraints {
            $0.top.equalTo(menuImage.snp.top)
            $0.leading.equalTo(menuImage.snp.trailing)
        }
        
        kindENGLabel.snp.makeConstraints {
            $0.top.equalTo(kindKRLabel.snp.bottom)
            $0.leading.equalTo(menuImage.snp.trailing)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(kindENGLabel.snp.bottom)
            $0.leading.equalTo(menuImage.snp.trailing)
        }
        
    }
}

