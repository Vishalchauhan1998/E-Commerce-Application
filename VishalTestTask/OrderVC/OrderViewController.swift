//
//  OrderViewController.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 06/04/23.
//

import UIKit

class OrderViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tblViewOrder: UITableView!
    @IBOutlet weak var srcBarName: UISearchBar!
    @IBOutlet weak var btnFilter: UIButton!
    
    // MARK: - Variables
    var orderData = [OrderDetails]()
    var searchProduct = [OrderDetails]()
    var searching = false
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Order Details"
        setupCell()
        getAPIData()
    }
    
    private func setupCell(){
        tblViewOrder.delegate = self
        tblViewOrder.dataSource = self
        srcBarName.delegate = self
        
        // Register Custom cell
        tblViewOrder.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
    }
    
    // MARK: - IBAction
    
    @IBAction func onTappedFilter(_ sender: UIButton) {
        let ac = UIAlertController(title: "Filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Price Low to High", style: .default, handler: lowTohigh))
        ac.addAction(UIAlertAction(title: "Price High to Low", style: .default, handler: hightolow))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func lowTohigh(action : UIAlertAction){
        searchProduct = orderData.sorted(){$0.orderAmount < $1.orderAmount }
        searching = true
        tblViewOrder.reloadData()
    }
    
    func hightolow(action : UIAlertAction){
        searchProduct = orderData.sorted(){$0.orderAmount > $1.orderAmount}
        searching = true
        tblViewOrder.reloadData()
    }
}

// MARK: - Tableview DataSource Method

extension OrderViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchProduct.count
        }
        else{
            return orderData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = orderData[indexPath.row]
        let searchData = searchProduct[indexPath.row]
        if let cell  = tblViewOrder.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as? OrderTableViewCell{
            if searching{
                cell.setData(item: searchData)
            }
            else{
                cell.setData(item: data)
            }
            return cell
        }
        return UITableViewCell()
    }
}
// MARK: - TableView Delegate Method

extension OrderViewController: UITableViewDelegate{
}

// MARK: - Extension for API CALL
extension OrderViewController{
    func getAPIData(){
        let url = "b/H296"
        APIManager.shared.fetchAPIData(url: url, requestType: .GET){
            (result:Order)
            in
            DispatchQueue.main.async{
                let data =  result.data
                self.orderData.append(contentsOf: data)
                self.searchProduct = self.orderData
                self.tblViewOrder.reloadData()
            }
        }
    }
}

// MARK: - searchbar Delegate Method
extension OrderViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //searchProduct =  orderData.filter({$0.productName.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
        if !searchText.isEmpty{
            searching = true
            searchProduct.removeAll()
            for i in orderData{
                if i.productName.lowercased().contains(searchText.lowercased())
                {
                    searchProduct.append(i)
                }
            }
        }
        else{
            searching = false
            searchProduct.removeAll()
            searchProduct = orderData
        }
        tblViewOrder.reloadData()
    }
}
