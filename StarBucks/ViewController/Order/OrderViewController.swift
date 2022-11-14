//
//  OrderViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/07.
//

import UIKit
import Then
import SnapKit
import Parchment
import Tabman
import Pageboy
import RxCocoa
import RxSwift
import NSObject_Rx

// Order탭 했을 시 나오는 첫화면 
class OrderViewController: TabmanViewController {
    
    var viewControllers: Array<UIViewController> = [AllMenuViewController(), MyMenuViewController()]
    
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
    
    private lazy var shadowLine = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor.systemGray3.cgColor
        $0.layer.shadowRadius = 0.8
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.masksToBounds = false
    }
    
    private lazy var selectStore = selectStoreView()
    
    // MARK: - viewDidAppear()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNav()
        setupView()
        bindTableView()
        bindView()
        tabManSet()
    }
}

// MARK: - extension
extension OrderViewController {
    private func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Order"
        
        let magnifyingglassBtn = UIBarButtonItem(image: .init(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchBtnClick))
        magnifyingglassBtn.tintColor = UIColor(r: 83, g: 83, b: 83)
        self.navigationItem.rightBarButtonItem = magnifyingglassBtn
    }
    
    @objc private func searchBtnClick() {
        
    }
    
    private func setupView() {
        view.addSubviews([cakeReservation,
                          shadowLine,
                          selectStore])
        
        cakeReservation.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        shadowLine.snp.makeConstraints {
            $0.top.equalTo(cakeReservation.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        selectStore.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(65)
        }
    }
    
    private func bindTableView(){
        
    }
    
    private func bindView() {
        self.cakeReservation.rx.tap
            .bind {
                self.navigationController?.pushViewController(MenuListViewController(), animated: true)
            }.disposed(by: rx.disposeBag)
        
        self.selectStore.poketBtn.rx.tap
            .bind {
                self.navigationController?.pushViewController(PoketViewController(), animated: true)
            }.disposed(by: rx.disposeBag)
            
    }
    
    private func tabManSet() {
        self.dataSource = self
        
        // create Bar
        let bar = TMBar.ButtonBar()
        settingTabBar(setBar: bar)
        addBar(bar, dataSource: self, at: .top)
    }
}

// MARK: - Pageboy, TabMan DataSource
extension OrderViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        // tab 안에 글씨 들
        switch index {
        case 0:
            return TMBarItem(title: " 전체 메뉴 ")
        case 1:
            return TMBarItem(title: " 나만의 메뉴 ")
        default:
            return TMBarItem(title: "전체 메뉴")
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        //위에서 선언한 vc array의 count를 반환
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func settingTabBar(setBar: TMBar.ButtonBar) {
        setBar.layout.transitionStyle = .snap
        
        // 왼쪽 여백
        setBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        
        setBar.layout.interButtonSpacing = 30
        
        setBar.backgroundView.style = .clear
        
        // 선택 / 안선택 색 + font size
        setBar.buttons.customize { (button) in
            button.tintColor = .gray
            button.selectedTintColor = .black
            button.font = .systemFont(ofSize: 18, weight: .bold)
            button.selectedFont = .systemFont(ofSize: 18, weight: .medium)
        }
        
        // 인디케이터
        setBar.indicator.weight = .custom(value: 3)
        setBar.indicator.tintColor = UIColor(r: 47, g: 134, b: 80)
//        setBar.indicator
        
    }
}

// MARK: - class selectStoreView
final class selectStoreView: UIView {
    
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
    
    lazy var poketBtn = UIButton().then {
        $0.setImage(.init(systemName: "bag", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .regular, scale: .default)), for: .normal)
        $0.tintColor = .white
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    private lazy var bagLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - function
    private func setupView() {
        
        backgroundColor = UIColor(r: 74, g: 74, b: 74)
        
        addSubviews([selectStoreBtn, seperateLine, poketBtn, bagLabel])
        
        selectStoreBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(275)
            $0.height.equalTo(45)
        }
        
        seperateLine.snp.makeConstraints {
            $0.top.equalTo(selectStoreBtn.snp.bottom).inset(5)
            $0.leading.equalTo(selectStoreBtn.snp.leading).inset(5)
            $0.trailing.equalTo(selectStoreBtn.snp.trailing)
            $0.height.equalTo(1)
        }
        
        poketBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        bagLabel.snp.makeConstraints {
            $0.centerX.equalTo(poketBtn)
            $0.top.equalTo(poketBtn.snp.top).inset(16)
        }
    }
}
