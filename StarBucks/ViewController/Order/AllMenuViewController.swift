//
//  AllMenuViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/08.
//

import Foundation
import UIKit

// 전체메뉴 버튼 눌렀을 시 나오는 화면 
class AllMenuViewController: UIViewController {
    private lazy var subTitleMenu = subTitleMenusView()
    
    private lazy var shadowLine = UIView().then {
        $0.backgroundColor = .systemGray3
    }
    
    private lazy var tableView = UITableView().then {
        $0.register(AllMenuTableViewCell.self, forCellReuseIdentifier: "AllMenuTableViewCell")
        $0.backgroundColor = .white
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
}

// MARK: - extension
extension AllMenuViewController {
    private func setupLayout() {
        view.addSubviews([subTitleMenu,
                          shadowLine,
                          tableView])

        subTitleMenu.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(55)
        }

        shadowLine.snp.makeConstraints {
            $0.top.equalTo(subTitleMenu.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(shadowLine.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - clase subTitleMenusView
final class subTitleMenusView: UIView {
    private lazy var beverageBtn = UIButton().then {
        $0.setTitle("음료", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.contentHorizontalAlignment = .center
    }
    
    private lazy var newLabel = UILabel().then {
        $0.text = "New"
        $0.textColor = UIColor(r: 47, g: 134, b: 80)
        $0.font = .systemFont(ofSize: 10, weight: .bold)
    }
    
    private lazy var foodBtn = UIButton().then {
        $0.setTitle("푸드", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.contentHorizontalAlignment = .center
    }
    
    private lazy var newLabelTwo = UILabel().then {
        $0.text = "New"
        $0.textColor = UIColor(r: 47, g: 134, b: 80)
        $0.font = .systemFont(ofSize: 10, weight: .bold)
    }
    
    private lazy var MDBtn = UIButton().then {
        $0.setTitle("상품", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.contentHorizontalAlignment = .center
    }
    
    private lazy var newLabelThree = UILabel().then {
        $0.text = "New"
        $0.textColor = UIColor(r: 47, g: 134, b: 80)
        $0.font = .systemFont(ofSize: 10, weight: .bold)
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
        beverageBtn.rx.tap
            .bind {
                print("beverageBtn _ Clicked")
            }.disposed(by: rx.disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews([beverageBtn,
                     newLabel,
                     foodBtn,
                     newLabelTwo,
                     MDBtn,
                     newLabelThree])
        
        beverageBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(30)
        }
        
        newLabel.snp.makeConstraints {
            $0.top.equalTo(beverageBtn.snp.top).inset(8)
            $0.leading.equalTo(beverageBtn.snp.trailing)
        }
        
        foodBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(newLabel.snp.trailing).offset(15)
        }
        
        newLabelTwo.snp.makeConstraints {
            $0.top.equalTo(foodBtn.snp.top).inset(8)
            $0.leading.equalTo(foodBtn.snp.trailing)
        }
        
        MDBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(newLabelTwo.snp.trailing).offset(15)
        }
        
        newLabelThree.snp.makeConstraints {
            $0.top.equalTo(MDBtn.snp.top).inset(8)
            $0.leading.equalTo(MDBtn.snp.trailing)
        }
    }
}
