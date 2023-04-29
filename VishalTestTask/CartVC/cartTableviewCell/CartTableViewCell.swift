//
//  CartTableViewCell.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 05/04/23.
//

import UIKit

class CartTableViewCell: UITableViewCell {    
    @IBOutlet weak var lblProductname: UILabel!
    @IBOutlet weak var lblSkuid: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var txtNumQty: UITextField!
    @IBOutlet weak var qtyStepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        qtyStepper.autorepeat = true
        qtyStepper.isContinuous = true
        txtNumQty.text = Int(qtyStepper.value).description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(item: CartItem){
        lblProductname.text = item.productName
        lblSkuid.text = item.productSkuId
        lblPrice.text = item.productPrice
    }
    
    @IBAction func onTappedQtyStepper(_ sender: UIStepper) {
        txtNumQty.text = Int(sender.value).description
    }
}
