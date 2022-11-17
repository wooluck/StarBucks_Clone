//
//  AllMenuDetailViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/17.
//

import Foundation
import UIKit

class AllMenuDetailViewController: UIViewController {
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "아이스 카페 아메리카노"
        $0.font = .systemFont(ofSize: 22, weight: .bold)
    }
    
    private lazy var bestLabel = UILabel().then {
        $0.text = "Best"
        $0.textColor = UIColor(r: 250, g: 64, b: 53)
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    private lazy var detailLabel = UILabel().then {
        $0.text = "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피"
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.numberOfLines = 0
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "4,500원"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private lazy var hotBtn = UIButton().then {
        $0.setTitle("HOT", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(UIColor(r: 202, g: 55, b: 20), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.cornerRadius = 10
    }
    
    private lazy var iceBtn = UIButton().then {
        $0.setTitle("ICE", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(UIColor(r: 20, g: 70, b: 102), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.cornerRadius = 10
    }
    
    private lazy var detailLabelView = UIView()
    
    private lazy var nutritionBtn = UIButton()
    
//    private lazy var otherMenuView = UICollectionView()
    private lazy var otherMenuView = UIView()
    
    private lazy var orderBtn = UIButton()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
    }
}

// MARK: - extension
extension AllMenuDetailViewController {
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubviews([titleLabel, bestLabel,
                         detailLabel,
                         priceLabel,
                         hotBtn, iceBtn,
                         detailLabelView,
                         nutritionBtn,
                         otherMenuView,
                         orderBtn])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(20)
            
        }
        
        bestLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top).offset(7)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(20)
        }
        
        hotBtn.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
        iceBtn.snp.makeConstraints {
            $0.top.equalTo(hotBtn.snp.top)
            $0.leading.equalTo(hotBtn.snp.trailing)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
        detailLabelView.snp.makeConstraints {
            $0.top.equalTo(hotBtn.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        nutritionBtn.snp.makeConstraints {
            $0.top.equalTo(detailLabelView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        otherMenuView.snp.makeConstraints {
            $0.top.equalTo(nutritionBtn.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        orderBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
}
