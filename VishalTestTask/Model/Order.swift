//
//  Order.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 06/04/23.
//

import Foundation

struct Order: Codable {
    let data: [OrderDetails]
}

// MARK: - Datum
struct OrderDetails: Codable {
    let orderAmount: String
    let orderDate: String
    let productName: String
    let skuID: String
    let price: String
    let currency: String

    enum CodingKeys: String, CodingKey {
        case orderAmount = "order_amount"
        case orderDate = "order_date"
        case productName = "product_name"
        case skuID = "sku_id"
        case price
        case currency
    }
}
