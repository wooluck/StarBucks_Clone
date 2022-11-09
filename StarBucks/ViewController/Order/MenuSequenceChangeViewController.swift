//
//  MenuSequenceChangeViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/09.
//

import Foundation
import UIKit

class MenuSequenceChangeViewController: UIViewController {
    
    private var navigationView = UIView()
    
    private var contentView = UIView()
    
    private var btnView = UIView()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNav()
        setupLayout()
        view.backgroundColor = .white
    }
}

// MARK: - extension
extension MenuSequenceChangeViewController {
    private func setupLayout() {
        view.addSubviews([navigationView,
                         contentView,
                         btnView])
        
        navigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(btnView.snp.top)
        }
        
        btnView.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
}
