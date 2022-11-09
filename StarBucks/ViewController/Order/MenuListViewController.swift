//
//  MenuListViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/09.
//

import Foundation
import UIKit

class MenuListViewController: UIViewController {
    
    
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

