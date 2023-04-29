//
//  OrderTableViewCell.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 06/04/23.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblSkuId: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var lblOrderAmount: UILabel!
    
    //MARK: - Awake From NIb
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setData(item: OrderDetails){
        lblProductName.text = item.productName
        lblSkuId.text =  item.skuID
        lblPrice.text = item.price
        lblOrderDate.text = item.orderDate
        lblOrderAmount.text = item.orderAmount
        
        contentView.layer.borderWidth = 5
        contentView.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor  = .systemBlue.withAlphaComponent(0.5)
    }
    
}
