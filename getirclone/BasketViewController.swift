//
//  BasketViewController.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit

class BasketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var totalValue = 0.0
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "BasketTableViewCell", bundle: nil), forCellReuseIdentifier: "basket")
    }
    
    @IBAction func payAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "pay") as! PayViewController
        self.present(vc, animated: false)
    }
    @IBAction func removeAllBasket(_ sender: Any) {
        ProductManager.shared.clearProducts()
        self.products = ProductManager.shared.loadProducts()
        self.tableView.reloadData()
        self.totalLabel.text = "Toplam: 0 TL"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.totalValue = 0
        self.products = ProductManager.shared.loadProducts()
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basket", for: indexPath) as! BasketTableViewCell
        cell.bind(product: products[indexPath.row])
        self.totalValue += (products[indexPath.row].price * Double(cell.count))
        self.totalLabel.text = "Toplam: \(totalValue) TL"
        cell.deleteBlock = {
            self.products.remove(at: indexPath.row)
            ProductManager.shared.saveProducts(self.products)
            self.tableView.reloadData()
        }
        
        cell.priceUpdateBlock = {
            self.totalValue += self.products[indexPath.row].price
            self.totalLabel.text = "Toplam: \(self.totalValue) TL"
        }
        
        cell.priceDownBlock = {
            if self.products.count == 0 {
                self.totalLabel.text = "Toplam: 0 TL"
            }
            else
            {
                self.totalValue -= self.products[indexPath.row].price
                self.totalLabel.text = "Toplam: \(self.totalValue) TL"
            }
            
        }
        return cell
    }
    
    
}
