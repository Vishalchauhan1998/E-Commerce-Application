//
//  selectAddressTableViewCell.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 06/04/23.
//

import UIKit

protocol sendDataProtocal{
    func sendToAddressController()
}

class selectAddressTableViewCell: UITableViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnEditAddress: UIButton!
    var senddata :sendDataProtocal?
    //MARK: - AWake form Nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(item : Address){
        lblAddress.text = item.name + ", " + item.societyName + ", " + item.areaName + ", " + item.pincode + ", " + item.city + ", " + item.state + ", " + item.phoneNumber
    }
    
    //MARK: - IBACtion
    @IBAction func opnTappedEditAddress(_ sender: UIButton) {
        self.senddata?.sendToAddressController()
    }
}





