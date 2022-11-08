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
    
//    private lazy var cakeReservation = UIButton().then {
//
//    }

    // MARK: - viewDidAppear()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // viewDidAppear 에서만 되고 위에 titleMenus에 바로 속성 적용하면 안됨.
        titleMenu.layer.addBorder([.bottom], color: .gray, width: 1.0)
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
        view.addSubviews([titleMenu])
        
        titleMenu.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}

// MARK: - class titleMenusView
final class titleMenusView: UIView {
    private lazy var titleStackView = UIStackView().then {
//        $0.spacing = 20
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
        barView.snp.updateConstraints {
            $0.leading.equalTo(sender.frame.origin.x)
            $0.width.equalTo(sender.bounds.width)
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
}
