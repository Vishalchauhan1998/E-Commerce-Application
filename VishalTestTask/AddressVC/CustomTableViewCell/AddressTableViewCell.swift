//
//  AddressTableViewCell.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 06/04/23.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    //MARK: - IBOutlet
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSocityName : UILabel!
    @IBOutlet weak var lblAeraName : UILabel!
    @IBOutlet weak var lblCity : UILabel!
    @IBOutlet weak var lblState : UILabel!
    @IBOutlet weak var lblPincode : UILabel!
    @IBOutlet weak var lblMoblieNumber : UILabel!
    
    //MARK: - Awake from Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(item: Address){
        lblName.text = item.name
        lblSocityName.text = item.societyName
        lblAeraName.text = item.areaName
        lblCity.text = item.city
        lblState.text = item.state
        lblPincode.text = item.pincode
        lblMoblieNumber.text = item.phoneNumber
    }
}
