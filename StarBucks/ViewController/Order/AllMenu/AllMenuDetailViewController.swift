//
//  AllMenuDetailViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/17.
//

import Foundation
import UIKit

class AllMenuDetailViewController: UIViewController {
    
    private lazy var bigImageView = UIImageView().then {
        $0.image = UIImage(named: "coffee")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "아이스 카페 아메리카노"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private lazy var bestLabel = UILabel().then {
        $0.text = "Best"
        $0.textColor = UIColor(r: 250, g: 64, b: 53)
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    private lazy var detailLabel = UILabel().then {
        $0.text = "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = UIColor.gray
        $0.numberOfLines = 0
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "4,500원"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private lazy var hotBtn = UIButton().then {
        $0.setTitle("HOT", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(UIColor(r: 202, g: 55, b: 20), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.cornerRadius = 10
    }
    
    private lazy var iceBtn = UIButton().then {
        $0.setTitle("ICE", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
//        $0.setTitleColor(UIColor(r: 20, g: 70, b: 102), for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(r: 63, g: 108, b: 198)
    }
    
    private lazy var detailLabelView = DetailLabelView()
    
    private lazy var seperateLine = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    private lazy var nutritionBtn = UIButton().then {
        $0.setTitle("제품 영양 정보", for: .normal)
        $0.setImage(.init(systemName: "arrowshape.turn.up.right"), for: .normal)
        $0.tintColor = .gray
        $0.setTitleColor(.black, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 22)
        $0.contentHorizontalAlignment = .leading
        $0.imageEdgeInsets = .init(top: 0, left: 330, bottom: 0, right: 0)
    }
    
//    private lazy var otherMenuView = UICollectionView()
    private lazy var othersMenuView = UIView()
    
    private lazy var orderBtnView = OrderBtnView()
    
    // MARK: - view
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        
        
        
    }
}

// MARK: - extension
extension AllMenuDetailViewController {
    private func setupView() {
        tabBarController?.tabBar.isHidden = true
//        navigationItem.titleView = UIImageView(image: UIImage(named: "recommend"))
    }
    private func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubviews([bigImageView,
                         titleLabel, bestLabel,
                         detailLabel,
                         priceLabel,
                         hotBtn, iceBtn,
                         detailLabelView,
                         seperateLine,
                         nutritionBtn,
                         othersMenuView,
                         orderBtnView])
        
        bigImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(bigImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(25)
            
        }
        
        bestLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top).offset(7)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(25)
        }
        
        hotBtn.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(25)
            $0.width.equalTo(self.view.frame.width / 2 - 25 )
            $0.height.equalTo(30)
        }
        
        iceBtn.snp.makeConstraints {
            $0.top.equalTo(hotBtn.snp.top)
            $0.leading.equalTo(hotBtn.snp.trailing)
            $0.width.equalTo(self.view.frame.width / 2 - 25 )
            $0.height.equalTo(30)
        }
        
        detailLabelView.snp.makeConstraints {
            $0.top.equalTo(hotBtn.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(100)
        }
        
        seperateLine.snp.makeConstraints {
            $0.top.equalTo(detailLabelView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        nutritionBtn.snp.makeConstraints {
            $0.top.equalTo(seperateLine.snp.bottom).offset(0)
            $0.leading.equalToSuperview().inset(5)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        othersMenuView.snp.makeConstraints {
            $0.top.equalTo(nutritionBtn.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        orderBtnView.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
}

// MARK: - class DetailLabelView
final class DetailLabelView: UIView {
    
    private lazy var detailLabel = UILabel().then {
        $0.text = "블론드/디카페인 커피 Tab에서 \n블론드, 디카페인, 1/2디카페인 아메리카노를 주문할 수 있습니다."
        $0.font = .systemFont(ofSize: 15, weight: .medium)
        $0.textColor = UIColor.gray
        $0.numberOfLines = 0
    }
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemGray6
    }
    
    private func setupLayout() {
        addSubviews([detailLabel])
        
        detailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}

// MARK: - class DetailLabelView
final class OtherMenuView: UIView {
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "비슷한 다른 메뉴"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = UIColor.gray
    }
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemGray6
    }
    
    private func setupLayout() {
        
    }
}

// MARK: - class OthersMenuView
final class OthersMenuView: UIView {
    private lazy var othersMenuLabel = UILabel().then {
        $0.text = "비슷한 다른 메뉴"
        $0.font = .systemFont(ofSize: 24, weight: .medium)
    }
//    private lazy var othersMenu
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
//        backgroundColor = .systemGray6
        
    }
    
    private func setupLayout() {
    
    }
}

// MARK: - class OrderBtnView
final class OrderBtnView: UIView {
    
    private lazy var orderBtn = UIButton().then {
        $0.setTitle("주문하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(r: 47, g: 134, b: 80)
        $0.layer.cornerRadius = 20
    }
    
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
//        backgroundColor = .systemGray6
        
    }
    
    private func setupLayout() {
        addSubviews([orderBtn])
        
        orderBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(40)
        }
    }
}

