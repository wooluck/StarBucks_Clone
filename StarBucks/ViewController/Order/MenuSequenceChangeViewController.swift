//
//  MenuSequenceChangeViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/09.
//

import Foundation
import UIKit

class MenuSequenceChangeViewController: UIViewController {
    
    private lazy var navigationView = NavigationView()
    
    private lazy var contentView = ContentView()
    
    private lazy var btnView = BtnView()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNav()
        setupLayout()
        view.backgroundColor = .white
        
        navigationView.navCancelBtn.rx.tap
            .bind {
                self.dismiss(animated: true)
            }.disposed(by: rx.disposeBag)
    }
}

// MARK: - extension
extension MenuSequenceChangeViewController {
    private func setupLayout() {
        view.addSubviews([navigationView,
                         contentView,
                         btnView])
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
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


// MARK: - class NavigationView
final class NavigationView: UIView {
    private lazy var titleLabel = UILabel().then {
        $0.text = "나만의 메뉴 순서변경"
    }
    
    lazy var navCancelBtn = UIButton().then {
        $0.setImage(.init(systemName: "multiply"), for: .normal)
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubviews([titleLabel, navCancelBtn])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        navCancelBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}


// MARK: - class ContentView
final class ContentView: UIView {
    private lazy var tableView = UITableView().then {
        $0.backgroundColor = .orange
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubviews([tableView])
        
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}


// MARK: - class BtnView
final class BtnView: UIView {
    private var cancelBtn = UIButton()
    
    private var changeBtn = UIButton()
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubviews([cancelBtn, changeBtn])
        
        cancelBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        changeBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}

