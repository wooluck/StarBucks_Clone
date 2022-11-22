//
//  AllMemuDetailNutritionViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/21.
//

import Foundation
import UIKit
import Tabman
import Pageboy
import RxCocoa
import RxSwift
import NSObject_Rx

class AllMenuDetailNutritionViewController: TabmanViewController {
    
    var model = AllMenuViewModel()
    var exex = AllMenuViewController()
    var bringKcal = PublishRelay<Menu>()
    lazy var passKcal: Int = 0
    
    private lazy var nutritionTitle = UILabel().then {
        $0.text = "제품 영양 정보"
        $0.font = .systemFont(ofSize: 18, weight: .medium)
    }
    
    lazy var kcal = UILabel().then {
        $0.text = "칼로리 : \(passKcal)"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
    }
    
    private lazy var vcs : Array<UIViewController> = []

    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        bindView()
    }
}

extension AllMenuDetailNutritionViewController {
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubviews([nutritionTitle,
                         kcal])
        
        nutritionTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
        
        kcal.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
    }
    
    private func bindView() {
        exex.viewModel.menuRelay
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] menu in
                guard let self = `self` else { return }
                self.passKcal = menu.kcal
            }).disposed(by: rx.disposeBag)
    }
}
