//
//  Product.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 05/04/23.
//

import Foundation

struct Product: Codable {
    let data: ProductList
}

// MARK: - DataClass
struct ProductList: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let productName, skuID, price, currency: String

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case skuID = "sku_id"
        case price, currency
    }
}
