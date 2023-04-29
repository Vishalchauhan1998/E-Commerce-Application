//
//  CustomTableViewCell.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 05/04/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    //MARK: - IBoutlet
    @IBOutlet weak var lblProductName : UILabel!
    @IBOutlet weak var lblSkuID : UILabel!
    @IBOutlet weak var lblPrice : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(item: Item){
        lblProductName.text = item.productName
        lblSkuID.text = item.skuID
        lblPrice.text = item.currency + item.price
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor  = .systemBlue.withAlphaComponent(0.5)
    }
}
