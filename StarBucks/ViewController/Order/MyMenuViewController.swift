//
//  MyMenuViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/08.
//

import Foundation
import UIKit

class MyMenuViewController: UIViewController {
    
    private lazy var orderWithSwitchView = OrderWithSwitchView()
    
    private lazy var tableView = UITableView().then {
        $0.register(MyMenuTableViewCell.self, forCellReuseIdentifier: "MyMenuTableViewCell")
//        $0.backgroundColor = .purple
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemGray2
        setupLayout()
    }
}

// MARK: - extension
extension MyMenuViewController {
    private func setupLayout() {
        view.addSubviews([orderWithSwitchView,
                         tableView])
        
        orderWithSwitchView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(55)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(orderWithSwitchView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - class OrderWithSwitchView
final class OrderWithSwitchView: UIView {
    private lazy var homeOrderLabel = UILabel().then {
        $0.text = "HOME에서 바로 주문"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private lazy var orderSwitch = UISwitch().then {
        $0.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
    }
    
    private lazy var orderChange = UIButton().then {
        $0.setTitle("순서변경", for: .normal)
        $0.setImage(.init(systemName: "arrow.up.arrow.down"), for: .normal)
        $0.tintColor = UIColor.gray
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 14)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceLeftToRight
        $0.imageEdgeInsets = .init(top: 0, left: -10, bottom: 0, right: 0)
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .systemGray6
        
        orderChange.rx.tap
            .bind {
                print("orderChange _ Clicked")
            }.disposed(by: rx.disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews([homeOrderLabel,
                    orderSwitch,
                    orderChange])
        
        homeOrderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(25)
        }
        
        orderSwitch.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalTo(homeOrderLabel.snp.trailing)
        }
        
        orderChange.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(25)
        }
    }
    
}

