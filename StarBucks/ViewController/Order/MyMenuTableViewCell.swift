//
//  MyMenuTableViewCell.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/09.
//

import Foundation
import UIKit

class MyMenuTableViewCell: UITableViewCell {
    
    private lazy var menuImage = UIImageView().then {
        $0.image = UIImage(named: "recommend")
    }
    
    private lazy var cancleBtn = UIButton().then {
        $0.setImage(.init(systemName: "multiply.circle"), for: .normal)
    }
    
    private lazy var myKindLabel = UILabel().then {
        $0.text = "나만의 카페 아메리카노"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private lazy var nameChangeBtn = UIButton().then {
        $0.setImage(.init(systemName: "pencil"), for: .normal)
    }
    
    private lazy var originalKindLabel = UILabel().then {
        $0.text = "Recommend"
        $0.font = .systemFont(ofSize: 15, weight: .light)
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "5,900원"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private lazy var hotOrIceLabel = UILabel().then {
        $0.text = "HOT"
    }
    
    private lazy var barLabel = UILabel().then {
        $0.text = "|"
    }
    
    private lazy var sizeLabel = UILabel().then {
        $0.text = "Tall"
    }
    
    private lazy var barLabelTwo = UILabel().then {
        $0.text = "|"
    }
    
    private lazy var takeOutOrInLabel = UILabel().then {
        $0.text = "매장컵"
    }
    
    private lazy var getBtn = UIButton().then {
        $0.setTitle("담기", for: .normal)
    }
    
    private lazy var buyBtn = UIButton().then {
        $0.setTitle("주문하기", for: .normal)
    }
    
    // MARK: - init()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        //            backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyMenuTableViewCell {
    private func setupLayout() {
        addSubviews([menuImage, cancleBtn,
                     myKindLabel,
                     originalKindLabel,
                     priceLabel,
                     hotOrIceLabel, barLabel, sizeLabel, barLabelTwo, takeOutOrInLabel,
                     getBtn, buyBtn])
        
        menuImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        
        cancleBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        myKindLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(menuImage.snp.trailing)
        }
        
        originalKindLabel.snp.makeConstraints {
            $0.top.equalTo(myKindLabel.snp.bottom)
            $0.leading.equalTo(menuImage.snp.trailing)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(originalKindLabel.snp.bottom)
            $0.leading.equalTo(menuImage.snp.trailing)
        }
        
        hotOrIceLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.leading.equalTo(menuImage.snp.trailing)
        }
        
        barLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.leading.equalTo(hotOrIceLabel.snp.trailing)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.leading.equalTo(barLabel.snp.trailing)
        }
        
        barLabelTwo.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.leading.equalTo(sizeLabel.snp.trailing)
        }
        
        takeOutOrInLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.leading.equalTo(barLabelTwo.snp.trailing)
        }
        
        getBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalTo(buyBtn.snp.leading)
        }
        
        buyBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
