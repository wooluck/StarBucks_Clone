//
//  MenuListViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/09.
//

import Foundation
import UIKit

// 홀케이크 예약도 레이아웃이 동일해서 같이 쓰일 예정 
class MenuListViewController: UIViewController {
    
    private lazy var tableView = UITableView().then {
        $0.register(AllMenuTableViewCell.self, forCellReuseIdentifier: "MenuListTableViewCell")
        $0.backgroundColor = .white
    }
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupLayout()
    }
}

// MARK: - extension
extension MenuListViewController {
    private func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "홀케이크 예약"
        
        let magnifyingglassBtn = UIBarButtonItem(image: .init(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        magnifyingglassBtn.tintColor = UIColor(r: 83, g: 83, b: 83)
        self.navigationItem.rightBarButtonItem = magnifyingglassBtn
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
    }
}

