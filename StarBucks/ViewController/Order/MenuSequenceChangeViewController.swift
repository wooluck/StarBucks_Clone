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
    
    private lazy var btnView = BtnView().then {
        $0.layer.shadowColor = UIColor.systemGray4.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowRadius = 5
        $0.layer.masksToBounds = false
        $0.backgroundColor = .white
    }

    
    private lazy var popupView = AlertViewController().then {
        $0.layer.shadowColor = UIColor.systemGray2.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 10
        $0.layer.masksToBounds = false
        $0.isHidden = true
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bindView()
        view.backgroundColor = .white
    }
}

// MARK: - extension
extension MenuSequenceChangeViewController {
    private func setupLayout() {
        view.addSubviews([navigationView,
                         contentView,
                         btnView,
                         popupView])
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(60)
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
            $0.height.equalTo(70)
        }
        
        popupView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(170)
        }
    }
    
    private func bindView() {
        navigationView.navCancelBtn.rx.tap
            .bind {
                self.popupView.isHidden = false
            }.disposed(by: rx.disposeBag)
        
        btnView.cancelBtn.rx.tap
            .bind {
                self.popupView.isHidden = false
            }.disposed(by: rx.disposeBag)
        
        popupView.cancelBtn.rx.tap
            .bind {
                self.dismiss(animated: true)
            }.disposed(by: rx.disposeBag)
    }
}


// MARK: - class NavigationView
final class NavigationView: UIView {
    private lazy var titleLabel = UILabel().then {
        $0.text = "나만의 메뉴 순서변경"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    lazy var navCancelBtn = UIButton().then {
        $0.setImage(.init(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .regular, scale: .default)), for: .normal)
        $0.tintColor = UIColor(r: 83, g: 83, b: 83)
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
//        navCancelBtn.rx.tap
//            .bind {
//                <#code#>
//            }

        
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
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}


// MARK: - class ContentView
final class ContentView: UIView {
    private lazy var tableView = UITableView()
//        .then {
//        $0.backgroundColor = .orange
//    }
    
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
    private var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        
    }
    
    lazy var cancelBtn = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(UIColor(r: 47, g: 134, b: 80), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(r: 47, g: 134, b: 80).cgColor
        $0.layer.cornerRadius = 20
        
    }
    
    private lazy var changeBtn = UIButton().then {
        $0.setTitle("순서 변경하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(r: 47, g: 134, b: 80)
        $0.layer.cornerRadius = 20
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
//        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubviews([cancelBtn, changeBtn])

        cancelBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(UIScreen.main.bounds.width / 2 - 30)
            $0.height.equalTo(40)
        }

        changeBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(UIScreen.main.bounds.width / 2 - 30)
            $0.height.equalTo(40)
        }
    }
}

