//
//  CheckOutViewController.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 06/04/23.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    // MARK: - IbOutlet
    @IBOutlet weak var tblViewCheckOut: UITableView!
    @IBOutlet weak var btnplaceOrder: UIButton!
    // MARK: - Variables
    
    var cartProduct = [CheckoutItem]()
    var cartAddress = [Address]()
    var sectionName = [" Cart Items ", "Selected Address"]

    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CheckOut"
        setupcell()
    }
    
    private func setupcell(){
        tblViewCheckOut.dataSource = self
        tblViewCheckOut.delegate = self
        // register product Xib
        tblViewCheckOut.register(UINib(nibName: "selectProductTableViewCell", bundle: nil), forCellReuseIdentifier: "selectProductTableViewCell")
        // register Addrss Xib
        tblViewCheckOut.register(UINib(nibName: "selectAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "selectAddressTableViewCell")
    }
    
    // MARK: - IBAction
    @IBAction func onTappedPlaceOrder(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let OrderVC = storyboard.instantiateViewController(withIdentifier: "OrderViewController" ) as! OrderViewController
        self.navigationController?.pushViewController(OrderVC, animated: true)
    }
}

// MARK: - Tableview DataSource Method

extension CheckOutViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return cartProduct.count
        }
        else{
            return cartAddress.count
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let data = cartProduct[indexPath.row]
            if let cell = tblViewCheckOut.dequeueReusableCell(withIdentifier: "selectProductTableViewCell", for: indexPath) as? selectProductTableViewCell{
                cell.setData(item: data)
                cell.senddata = self
                return cell
            }
        }
        else {
            let data1 = cartAddress[indexPath.row]
            if let cell = tblViewCheckOut.dequeueReusableCell(withIdentifier: "selectAddressTableViewCell", for: indexPath) as? selectAddressTableViewCell{
                cell.setData(item: data1)
                cell.senddata = self
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionName.count
    }
}

// MARK: - Extension use for navigate Protocal

extension CheckOutViewController : sendDataProtocal , navigateDataProtocal{
    
    func sendToAddressController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func sendToCartController() {
        for controller in self.navigationController!.viewControllers as Array{
            if controller.isKind(of: CartViewController.self){
                self.navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
}


// MARK: - TableView Delegate Method

extension CheckOutViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame:  CGRect(x: 0, y: 0, width: self.tblViewCheckOut.frame.width, height: 20))
        let lblheader = UILabel(frame:  CGRect(x: 0, y: 0, width: self.tblViewCheckOut.frame.width, height: 20))
        switch section {
            case 0:
                  lblheader.text = sectionName[section]
            default:
                  lblheader.text = sectionName[section]
            }
        lblheader.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(lblheader)
        return headerView
    }
    
    // Table Height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

