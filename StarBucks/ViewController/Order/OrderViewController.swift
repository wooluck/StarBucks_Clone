//
//  OrderViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/07.
//

import UIKit
import Then
import SnapKit

class OrderViewController: UIViewController {
    private lazy var titleMenu = titleMenusView().then {
        $0.backgroundColor = .white
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor.systemGray3.cgColor
        $0.layer.shadowRadius = 0.8
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.masksToBounds = false
        $0.titleConfigure(titles: ["    전체 메뉴    ", "    나만의 메뉴    "])
    }
    
    private lazy var cakeReservation = UIButton().then {
        $0.setTitle("홀케이크 예약", for: .normal)
        $0.setImage(.init(systemName: "cart"), for: .normal)
        $0.tintColor = UIColor(r: 47, g: 134, b: 80)
        $0.setTitleColor(UIColor(r: 47, g: 134, b: 80), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceLeftToRight
        $0.imageEdgeInsets = .init(top: 0, left: -10, bottom: 0, right: 0)
    }
    
    private lazy var subTitleMenu = subTitleMenusView()

    private lazy var tableView = UITableView()


    // MARK: - viewDidAppear()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // viewDidAppear 에서만 되고 위에 titleMenus에 바로 속성 적용하면 안됨.
        titleMenu.layer.addBorder([.bottom], color: .gray, width: 1.0)
        subTitleMenu.layer.addBorder([.bottom], color: .systemGray3, width: 1)
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNav()
        setupView()
    }
}

// MARK: - extension
extension OrderViewController {
    private func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Order"
        
        let magnifyingglassBtn = UIBarButtonItem(image: .init(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        magnifyingglassBtn.tintColor = .gray
        self.navigationItem.rightBarButtonItem = magnifyingglassBtn
    }
    
    private func setupView() {
        view.addSubviews([titleMenu, cakeReservation, subTitleMenu])
        
        titleMenu.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        cakeReservation.snp.makeConstraints {
            $0.top.equalTo(titleMenu.snp.top).inset(10)
            $0.trailing.equalToSuperview().inset(20)
//            $0.height.equalTo(30)
        }
        
        subTitleMenu.snp.makeConstraints {
            $0.top.equalTo(titleMenu.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(55)
        }
    }
}

// MARK: - class titleMenusView
final class titleMenusView: UIView {
    private lazy var titleStackView = UIStackView().then {
        $0.alignment = .center
    }
    
    private lazy var barView = UIView().then {
        $0.backgroundColor = UIColor(r: 47, g: 134, b: 80)
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews([titleStackView, barView])
        
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        barView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.width.equalTo(0)
        }
    }
    
    func titleConfigure(titles: [String]) {
        titles.enumerated().forEach { (i, title) in
            titleStackView.addArrangedSubview(createButton(title: title, tag: i))
        }
        layoutIfNeeded()
        
        if titleStackView.arrangedSubviews.count > 0,
           let first = titleStackView.arrangedSubviews.first as? UIButton {
            handleTap(first)
        }
    }
    
    private func createButton(title: String, tag: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }
    
    @objc private func handleTap(_ sender: UIButton) {
        print("sender : \(sender)")
        barView.snp.updateConstraints {
            $0.leading.equalTo(sender.frame.origin.x)
            $0.width.equalTo(sender.bounds.width)
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
}

// MARK: - clase subTitleMenusView
final class subTitleMenusView: UIView {
    private lazy var beverageBtn = UIButton().then {
        $0.setTitle("음료", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews([beverageBtn, newLabel, foodBtn, newLabelTwo, MDBtn, newLabelThree])
        beverageBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(25)
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
