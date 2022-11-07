//
//  UIView.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/07.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0)}
    }
}
