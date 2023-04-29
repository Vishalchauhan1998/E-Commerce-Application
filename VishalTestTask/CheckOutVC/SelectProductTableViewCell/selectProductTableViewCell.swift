//
//  selectProductTableViewCell.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 06/04/23.
//

import UIKit

protocol navigateDataProtocal{
    func sendToCartController()
}

class selectProductTableViewCell: UITableViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblQuentity: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnEditItem: UIButton!
    
    var senddata :navigateDataProtocal?

    //MARK: - AwakeForm Nib Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setData(item : CheckoutItem){
        lblProductName.text = item.item ?? ""
        lblQuentity.text = item.quentity ?? ""
        lblPrice.text = item.price ?? ""
    }
    
    //MARK: - IBAction
    @IBAction func onTappedEditItem(_ sender: UIButton) {
        self.senddata?.sendToCartController()
    }
}
