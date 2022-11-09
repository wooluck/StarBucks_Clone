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
    
    private lazy var kindLabel = UILabel().then {
        $0.text = "나만의 카페 아메리카노"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    
    private lazy var kindENGLabel = UILabel().then {
        $0.text = "Recommend"
        $0.font = .systemFont(ofSize: 15, weight: .light)
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

extension MyMenuTableViewCell {
    private func setupLayout() {
        
    }
}
