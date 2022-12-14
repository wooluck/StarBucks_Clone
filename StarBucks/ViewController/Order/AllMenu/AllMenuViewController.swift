//
//  AllMenuViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/08.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

// 음료, 푸드, 상품 탭
//enum AllmenuType {
//    case 200...377:
//    case 378...599:
//    case 600...800:
//}

// 전체메뉴 버튼 눌렀을 시 나오는 화면 
class AllMenuViewController: UIViewController {
    
    let AllNuVC = AllMenuDetailNutritionViewController()
    
    let selectMenu = AllMenuViewController()
    
    let viewModel = AllMenuViewModel()
    let trigger = PublishRelay<Void>()
    var beverageImg = UIImage()
    
    var menuRelay = BehaviorRelay<Menus>(value: [])
    var kcalRelay = BehaviorRelay<Int>(value: 0)
    
    
    private lazy var subTitleMenu = subTitleMenusView()
    
    private lazy var shadowLine = UIView().then {
        $0.backgroundColor = .systemGray3
    }
    
    private lazy var tableView = UITableView().then {
        $0.register(AllMenuTableViewCell.self, forCellReuseIdentifier: "AllMenuTableViewCell")
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.backgroundColor = .white
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        tableViewBind()
        trigger.accept(())
    }
}

// MARK: - extension
extension AllMenuViewController {
    private func setupLayout() {
        view.addSubviews([subTitleMenu,
                          shadowLine,
                          tableView])
        
        subTitleMenu.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(55)
        }
        
        shadowLine.snp.makeConstraints {
            $0.top.equalTo(subTitleMenu.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(shadowLine.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func tableViewBind() {
        let req = viewModel.transform(req: .init(trigger: trigger))
        
        req.menusRelay.bind { [weak self] menus in
            guard let self = `self` else { return }
            self.menuRelay.accept(menus)
        }.disposed(by: rx.disposeBag)
        
        self.menuRelay.asDriver()
            .drive(tableView.rx.items) { table, row, item in
                guard let cell = table.dequeueReusableCell(withIdentifier: AllMenuTableViewCell.id) as? AllMenuTableViewCell else { return UITableViewCell() }
                
                //                if 200..<378 ~= item.id {
                if let url = URL(string: item.image) {
                    cell.menuImage.load(url: url)
                    let imageData = try! Data(contentsOf: url)
                    cell.menuImage.image = UIImage(data: imageData)
                    self.beverageImg = UIImage(data: imageData) ?? UIImage.init(systemName: "clear")!
                } else {
                    print("Image URL Not Failed")
                }
                cell.selectionStyle = .none
                cell.TitleLabel.text = item.name
                cell.subTitleLabel.text = item.description
                //                }
                return cell
            }.disposed(by: rx.disposeBag)
        
        tableView.rx.modelSelected(Menu.self)
            .subscribe(onNext: { menu in
                print("wooluck menu :\(menu)")
                var AllVC = AllMenuDetailViewController()
                
                AllVC.titleLabel.text = menu.name
                AllVC.detailLabel.text = menu.description
                AllVC.priceLabel.text = "\(menu.price)원"
                if let url = URL(string: menu.image) {
                    AllVC.bigImageView.load(url: url)
                    let imageData = try! Data(contentsOf: url)
                    AllVC.bigImageView.image = UIImage(data: imageData)
                } else {
                    print("Image URL Not Failed")
                }
                self.viewModel.menuRelay.accept(menu)

                self.navigationController?.pushViewController(AllVC, animated: true)
            }).disposed(by: rx.disposeBag)
    }
}

// MARK: - clase subTitleMenusView
final class subTitleMenusView: UIView {
    private lazy var beverageBtn = UIButton().then {
        $0.setTitle("음료", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.contentHorizontalAlignment = .center
    }
    
    private lazy var newLabel = UILabel().then {
        $0.text = "New"
        $0.textColor = UIColor(r: 47, g: 134, b: 80)
        $0.font = .systemFont(ofSize: 10, weight: .bold)
    }
    
    private lazy var foodBtn = UIButton().then {
        $0.setTitle("푸드", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.contentHorizontalAlignment = .center
    }
    
    private lazy var newLabelTwo = UILabel().then {
        $0.text = "New"
        $0.textColor = UIColor(r: 47, g: 134, b: 80)
        $0.font = .systemFont(ofSize: 10, weight: .bold)
    }
    
    private lazy var MDBtn = UIButton().then {
        $0.setTitle("상품", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.contentHorizontalAlignment = .center
    }
    
    private lazy var newLabelThree = UILabel().then {
        $0.text = "New"
        $0.textColor = UIColor(r: 47, g: 134, b: 80)
        $0.font = .systemFont(ofSize: 10, weight: .bold)
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
        addSubviews([beverageBtn,
                     newLabel,
                     foodBtn,
                     newLabelTwo,
                     MDBtn,
                     newLabelThree])
        
        beverageBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(30)
        }
        
        newLabel.snp.makeConstraints {
            $0.top.equalTo(beverageBtn.snp.top).inset(8)
            $0.leading.equalTo(beverageBtn.snp.trailing)
        }
        
        foodBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(newLabel.snp.trailing).offset(15)
        }
        
        newLabelTwo.snp.makeConstraints {
            $0.top.equalTo(foodBtn.snp.top).inset(8)
            $0.leading.equalTo(foodBtn.snp.trailing)
        }
        
        MDBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(newLabelTwo.snp.trailing).offset(15)
        }
        
        newLabelThree.snp.makeConstraints {
            $0.top.equalTo(MDBtn.snp.top).inset(8)
            $0.leading.equalTo(MDBtn.snp.trailing)
        }
    }
}
