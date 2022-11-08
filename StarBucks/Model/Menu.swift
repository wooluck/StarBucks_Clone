//
//  Menu.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/08.
//

import Foundation

struct Menu: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Int
    let image: String
    let kcal: Int
}
