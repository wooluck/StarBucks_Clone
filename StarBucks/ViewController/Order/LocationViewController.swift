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
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let naverMapView = NMFNaverMapView(frame: view.frame)
            view.addSubview(naverMapView)
        naverMapView.showLocationButton = true
        
    }
}
