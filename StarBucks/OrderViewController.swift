//
//  OrderViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/07.
//

import UIKit

class OrderViewController: UIViewController {
    
    private lazy var titleMenus = UIView()

    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNav()
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
}
