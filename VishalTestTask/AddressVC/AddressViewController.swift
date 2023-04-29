//
//  AddressViewController.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 06/04/23.
//

import UIKit

struct Address{
    let name : String
    let societyName : String
    let areaName : String
    let city : String
    let state :String
    let pincode : String
    let phoneNumber : String
}


class AddressViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var addressTableView: UITableView!
    @IBOutlet weak var btnCheckout: UIButton!
    
    var addressDetails = [Address(name: "Vishal Chauhan", societyName: "Shivrjani Society", areaName: "Shivrjani", city: "Ahmedabad", state: "Gujarat", pincode: "380015", phoneNumber: "987456321"),
                          Address(name: "Kevin Shah", societyName: "Payal Park Society", areaName: "Satelight", city: "Ahmedabad", state: "Gujarat", pincode: "380015", phoneNumber: "8965471230"),
                          Address(name: "Raj Patel", societyName: "Janta Society", areaName: "Bandra", city: "Mumbai" , state: "Maharathra", pincode: "470051", phoneNumber: "7896541235")
    ]
    
    var selectedAddress = [Address]()
    var cartItem = [CheckoutItem]()
    
    // MARK: - Viewcontroller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Address"
        setupCell()
    }
    
    private func setupCell(){
        addressTableView.delegate = self
        addressTableView.dataSource = self
        // register Custom Xib
        addressTableView.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
    }
    
    // MARK: - IBACtion
    @IBAction func onTappedBtnCheckout(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let chackOutVC = storyboard.instantiateViewController(withIdentifier: "CheckOutViewController") as! CheckOutViewController
        chackOutVC.cartProduct = cartItem
        chackOutVC.cartAddress = selectedAddress
        self.navigationController?.pushViewController(chackOutVC, animated: true)
    }
}

// MARK: - Tableview datasource Method

extension AddressViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = addressDetails[indexPath.row]
        if let cell = addressTableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as? AddressTableViewCell{
            cell.setData(item: data)
            return cell
        }
        return UITableViewCell()
    }
}

extension AddressViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell is Selected")
        let selectedData = addressDetails[indexPath.row]
        if selectedAddress.isEmpty{
            let address = [Address(name: selectedData.name, societyName: selectedData.societyName, areaName: selectedData.areaName, city: selectedData.city, state: selectedData.state, pincode: selectedData.pincode, phoneNumber: selectedData.phoneNumber)]
            selectedAddress.append(contentsOf: address)
        }
        else{
            selectedAddress.removeAll()
            let address = [Address(name: selectedData.name, societyName: selectedData.societyName, areaName: selectedData.areaName, city: selectedData.city, state: selectedData.state, pincode: selectedData.pincode, phoneNumber: selectedData.phoneNumber)]
            selectedAddress.append(contentsOf: address)
        }
    }
}
