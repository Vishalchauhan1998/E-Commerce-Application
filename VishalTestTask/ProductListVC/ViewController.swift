//
//  ViewController.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 05/04/23.
//

import UIKit

struct CartItem{
    let productName : String?
    let productSkuId  : String?
    let productPrice : String?
}

class ViewController: UIViewController {
    
    //MARK:  - IBOutlet
    @IBOutlet weak var tblViewProduct: UITableView!
    @IBOutlet weak var btnAddToCart: UIButton!
    //MARK:  - Variables
    var productArray = [Item]()
    var productCart = [CartItem]()
    //MARK:  - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
        getAPIData()
    }
    private func setupCell(){
        tblViewProduct.delegate = self
        tblViewProduct.dataSource = self
        
        // register Custom Xib
        tblViewProduct.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    @IBAction func onTappAddToCart(_ sender: UIButton) {
        
        if productCart.isEmpty{
            let alert = UIAlertController(title: "Faild", message: "Please Select any product ", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        }
        
        else{
            let storyborad = UIStoryboard(name: "Main", bundle: nil)
            let cartVC = storyborad.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
            navigationController?.pushViewController(cartVC, animated: true)
            cartVC.cartArray = productCart
        }
    }
    
}
//MARK:  - TableView Datascource Method

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = productArray[indexPath.row]
        if let cell = tblViewProduct.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell{
            cell.setData(item: data)
            return cell
        }
        return UITableViewCell()
    }
}
//MARK:  - TableView Delegate Method
extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell =  productArray[indexPath.row]
        let cartData = [CartItem(productName: selectedCell.productName, productSkuId: selectedCell.skuID, productPrice: selectedCell.price)]
        productCart.append(contentsOf: cartData)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let productName = productArray[indexPath.row].productName
        for (i,item) in productCart.enumerated() {
            if productName == item.productName {
                productCart.remove(at: i)
            }
        }
    }
}

//MARK:  - extension for API call
extension ViewController{
    func getAPIData(){
        let url = "b/5XL6"
        APIManager.shared.fetchAPIData(url: url, requestType: .GET){
            (result:Product)
            in
            DispatchQueue.main.async{
                let data =  result.data.items
                self.productArray.append(contentsOf: data)
                self.tblViewProduct.reloadData()
            }
        }
    }
}
