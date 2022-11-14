//
//  PoketViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/14.
//

import Foundation
import UIKit

class PoketViewController: UIViewController {
    
    private lazy var selectStoreView = SelectStoreView()
    
    private lazy var selectFoodOrProduct = UIView()
    
    private lazy var poketTableView = UITableView()
    
    private lazy var emptyView = UIView()
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setView()
    }
}

// MARK: - extension
extension PoketViewController {
    private func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "장바구니"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(r: 74, g: 74, b: 74)
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
//        navigationItem.titleView?.backgroundColor = UIColor(r: 74, g: 74, b: 74)
        
    }
    
    private func setView() {
        view.backgroundColor = .white
        
        view.addSubviews([selectStoreView,
                         selectFoodOrProduct,
                         poketTableView, emptyView])
        
    }
}


// MARK: - class

class SelectStoreView: UIView {
    
    private lazy var selectStoreBtn = UIButton().then {
        $0.setTitle("주문할 매장을 선택해 주세요", for: .normal)
        $0.setImage(.init(systemName: "arrow.turn.right.down"), for: .normal)
        $0.tintColor = .white
        $0.setTitleColor(.white, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
        $0.contentHorizontalAlignment = .leading
        $0.imageEdgeInsets = .init(top: 0, left: 250, bottom: 0, right: 00)
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
        
    }
    
    
}

// MARK: - class
class SelectFoodOrProduct: UIView {
    
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

// MARK: - class
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
