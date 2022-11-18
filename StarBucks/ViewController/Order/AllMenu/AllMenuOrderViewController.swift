//
//  AllMenuOrderViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/18.
//

import Foundation
import UIKit

class AllMenuOrderViewController: UIViewController {
    private lazy var titleLabel = UILabel().then {
        $0.text = "아이스 카페 아메리카노"
    }
    
    private lazy var subLabel = UILabel().then {
        $0.text = "환경을 위해 일회용컵 사용 줄이기에 동참해 주세요"
    }
    
    private lazy var sizeLabel = UILabel().then {
        $0.text = "사이즈"
    }
    
    private lazy var cupSelectLabel = UILabel().then {
        $0.text = "컵 선택"
    }
    
    private lazy var seperateView = UIView()
    
    private lazy var personalBtn = UIButton()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
}

extension AllMenuOrderViewController {
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        
    }
}
