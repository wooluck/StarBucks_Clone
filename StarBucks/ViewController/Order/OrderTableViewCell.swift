//
//  OrderTableViewCell.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/08.
//

import Foundation
import UIKit

class OrderTableViewCell: UITableViewCell {
    
    private lazy var menuImage = UIImageView()
    
    private lazy var kindKRLabel = UILabel()
    
    private lazy var kindENGLabel = UILabel()
    
    // MARK: - init()
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            setupLayout()
    //        backgroundColor = .red
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension OrderTableViewCell {
    private func setupLayout() {
        addSubviews([menuImage, kindKRLabel, kindENGLabel])
    }
}
