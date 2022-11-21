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

class AllMenuDetailNutritionViewController: TabmanViewController {
    
    var model = AllMenuViewModel()
    var exex = AllMenuViewController()
    var bringKcal = PublishRelay<Int>()
    var passKcal: Int?
    
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
//        vcs.append(tallSizeViewController())
//        vcs.append(grandeSizeViewController())
//
//        self.dataSource = self
//
//        let bar = TMBar.ButtonBar()
//        bar.layout.transitionStyle = .snap
//        bar.indicator.weight = .custom(value: 1)
//        bar.indicator.tintColor = .black
//        bar.layout.alignment = .centerDistributed
//        bar.layout.interButtonSpacing = 10
//        bar.buttons.customize { (button) in
//            button.tintColor = .gray
//            button.selectedTintColor = .black
//            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
//        }
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
        model.menusRelay.asDriver()
            .drive(onNext:{ [weak self] kcal in
                guard let self = `self` else { return }
                
            }).disposed(by: rx.disposeBag)
    }
}
//
//extension AllMenuDetailNutritionViewController: PageboyViewControllerDataSource, TMBarDataSource {
//    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
//        // tab 안에 글씨 들
//        switch index {
//        case 0:
//            return TMBarItem(title: " 전체 메뉴 ")
//        case 1:
//            return TMBarItem(title: " 나만의 메뉴 ")
//        default:
//            return TMBarItem(title: "전체 메뉴")
//        }
//    }
//
//    func numberOfViewControllers(in pageboyViewController:
//                                 PageboyViewController) -> Int {
//        return vcs.count
//    }
//
//    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
//        return vcs[index]
//    }
//
//    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
//        return .at(index: 0)
//    }
//
//}
