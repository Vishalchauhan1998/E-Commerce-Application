//
//  CartViewController.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 05/04/23.
//

import UIKit

struct CheckoutItem{
    let item :String?
    let quentity :String?
    let price :String?
}
class CartViewController: UIViewController {

    // MARK: - IBoutlet
    @IBOutlet weak var tblViewCart: UITableView!
    @IBOutlet weak var btnAddAddress: UIButton!
    
    var cartArray = [CartItem] ()
    var arrayData = [CheckoutItem]()
    
    // MARK: - View Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cart"
        setupCell()
    }
    
    private func setupCell(){
        tblViewCart.delegate = self
        tblViewCart.dataSource = self
        // register Custom Xib
        tblViewCart.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
    }
    
    // MARK: - IBAction
    @IBAction func onTappedBtnAddAddress(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AddressVC = storyboard.instantiateViewController(withIdentifier: "AddressViewController") as! AddressViewController
        AddressVC.cartItem = arrayData
        self.navigationController?.pushViewController(AddressVC, animated: true)
    }
}
// MARK: - Tableview DataScource Method

extension CartViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = cartArray[indexPath.row]
        if let cell = tblViewCart.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell{
            cell.setData(item: data)
            return cell
        }
        return UITableViewCell()
    }
}
// MARK: - Tableview Delegate Method

extension CartViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedcell:CartTableViewCell = tblViewCart.cellForRow(at: indexPath) as? CartTableViewCell{
            let productName = selectedcell.lblProductname.text ?? ""
            let quentity = selectedcell.txtNumQty.text ?? ""
            let price = selectedcell.lblPrice.text ?? ""
            let cartData = [CheckoutItem(item: productName, quentity: quentity, price: price)]
            arrayData.append(contentsOf: cartData)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            arrayData.removeLast()
    }
}
