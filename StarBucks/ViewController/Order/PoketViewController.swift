//
//  PoketViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/14.
//

import Foundation
import UIKit
import Tabman
import Pageboy

class PoketViewController: TabmanViewController {
    
    var viewControllers: Array<UIViewController> = [PoketFoodViewController(), PoketProductViewController()]
    
    private lazy var selectStoreView = SelectStoreView()
    
    private lazy var selectFoodOrProduct = SelectFoodOrProduct()
    
    private lazy var poketTableView = UITableView()
    
    private lazy var emptyView = EmptyView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.navigationController?.navigationBar.backgroundColor = UIColor(r: 74, g: 74, b: 74)
        
    }
    
    // MARK: - viewWillDisappear()
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBar.backgroundColor = .white
    }
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(r: 74, g: 74, b: 74)
        setupNav()
        setView()
        
    }
}

// MARK: - extension
extension PoketViewController {
    private func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "장바구니"
        
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(r: 74, g: 74, b: 74)
//        self.navigationController?.navigationBar.standardAppearance = appearance;
//        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        
    }
    
    private func setView() {
        view.backgroundColor = .white
        
        view.addSubviews([selectStoreView,
                         selectFoodOrProduct,
                         poketTableView, emptyView])
        
        selectStoreView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(65)
        }
    }
    
}


// MARK: - class SelectStoreView

class SelectStoreView: UIView {
    
    private lazy var selectStoreBtn = UIButton().then {
        $0.setTitle("주문할 매장을 선택해 주세요", for: .normal)
        $0.setImage(.init(systemName: "arrow.turn.right.down"), for: .normal)
        $0.tintColor = .white
        $0.setTitleColor(.white, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
        $0.contentHorizontalAlignment = .leading
        $0.imageEdgeInsets = .init(top: 0, left: 340, bottom: 0, right: 00)
    }
    
    private lazy var seperateLine = UIView().then {
        $0.backgroundColor = .gray
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
        backgroundColor = UIColor(r: 74, g: 74, b: 74)
        
        addSubviews([selectStoreBtn, seperateLine])
        
        selectStoreBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
//            $0.width.equalTo(275)
            $0.height.equalTo(45)
        }
        
        seperateLine.snp.makeConstraints {
            $0.top.equalTo(selectStoreBtn.snp.bottom).inset(5)
            $0.leading.equalTo(selectStoreBtn.snp.leading).inset(10)
            $0.trailing.equalTo(selectStoreBtn.snp.trailing).inset(10)
            $0.height.equalTo(1)
        }
    }
    
    
}

// MARK: - class SelectFoodOrProduct
class SelectFoodOrProduct: UIView {
    private lazy var beverageFoodLabel = UILabel()
    
    private lazy var productLabel = UILabel()
    
    private lazy var beverageFoodCountLabel = UILabel()
    
    private lazy var productCountLabel = UILabel()
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
    }
}

// MARK: - class EmptyView
class EmptyView: UIView {
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
    }
}
