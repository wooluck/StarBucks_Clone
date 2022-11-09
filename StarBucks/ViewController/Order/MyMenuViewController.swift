//
//  MyMenuViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/08.
//

import Foundation
import UIKit

class MyMenuViewController: UIViewController {
    
    private lazy var orderWithSwitchView = UIView()
    
    private lazy var tableView = UITableView()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
    }
}

// MARK: - extension
extension MyMenuViewController {
    
}

// MARK: - class OrderWithSwitchView
final class OrderWithSwitchView: UIView {
    private lazy var homeOrderLabel = UILabel().then {
        $0.text = "HOME에서 바로 주문"
    }
    
    private lazy var orderSwitch = UISwitch()
    
    private lazy var orderChange = UIButton()
    
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

