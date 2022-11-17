//
//  LocationViewController.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/16.
//

import Foundation
import UIKit
import NMapsMap

class LocationViewController: UIViewController {
    
    private lazy var mapView = UIView()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setMapView()
//        setupLayout()
        
    }
}

extension LocationViewController {
    private func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "장소를 확인하시오"
    }
    
    private func setMapView() {
        let naverMapView = NMFNaverMapView(frame: view.frame)
            view.addSubview(naverMapView)
        naverMapView.showLocationButton = true
    }
    
    private func setupLayout() {
        view.addSubviews([mapView])
        
        mapView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
