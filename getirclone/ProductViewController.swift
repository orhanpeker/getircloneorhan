//
//  ProductViewController.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    var categoryType: Category? = nil
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createDummyData()
        self.productCollectionView.delegate = self
        self.productCollectionView.dataSource = self
        self.productCollectionView.register(UINib.init(nibName: "HomeBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "product")
    }
    
    
    
    private func createDummyData()
    {
        switch categoryType {
        case .food:
            let product1 = Product(name: "Makarna", price: 29.00, image: "makarna")
            let product2 = Product(name: "Ton Balık", price: 49.00, image: "ton-balik")
            let product3 = Product(name: "Kıyma", price: 159.00, image: "kiyma")
            let product4 = Product(name: "Tavuk", price: 99.00, image: "tavuk")
            let product5 = Product(name: "Pirinç", price: 59.00, image: "pirinc")
            self.products.append(product1)
            self.products.append(product2)
            self.products.append(product3)
            self.products.append(product4)
            self.products.append(product5)
            self.productCollectionView.reloadData()
        case .drink:
            let product1 = Product(name: "Su", price: 5.00, image: "su")
            let product2 = Product(name: "Kola", price: 9.00, image: "kola")
            let product3 = Product(name: "Sprite", price: 19.00, image: "sprite")
            let product4 = Product(name: "Fanta", price: 29.00, image: "fanta")
            let product5 = Product(name: "Enerji İçeceği", price: 49.00, image: "enerji")
            self.products.append(product1)
            self.products.append(product2)
            self.products.append(product3)
            self.products.append(product4)
            self.products.append(product5)
            self.productCollectionView.reloadData()
        case .milk:
            let product1 = Product(name: "Süt", price: 29.00, image: "sut")
            let product2 = Product(name: "Peynir", price: 109.00, image: "peynir")
            let product3 = Product(name: "Yoğurt", price: 72.00, image: "yogurt")
            let product4 = Product(name: "Süzme Yoğurt", price: 65.00, image: "suzme")
            let product5 = Product(name: "Kefir", price: 44.00, image: "kefir")
            self.products.append(product1)
            self.products.append(product2)
            self.products.append(product3)
            self.products.append(product4)
            self.products.append(product5)
            self.productCollectionView.reloadData()
        case .clean:
            let product1 = Product(name: "Sabun", price: 29.00, image: "sabun")
            let product2 = Product(name: "Bez", price: 29.00, image: "bez")
            let product3 = Product(name: "Deterjan", price: 59.00, image: "deterjan")
            self.products.append(product1)
            self.products.append(product2)
            self.products.append(product3)
            self.productCollectionView.reloadData()
        case .bread:
            let product1 = Product(name: "Tost Ekmeği", price: 69.00, image: "tost")
            let product2 = Product(name: "Ekmek", price: 9.00, image: "ekmek")
            let product3 = Product(name: "Lavaş", price: 12.00, image: "lavas")
            let product4 = Product(name: "Tam Buğday Ekmek", price: 16.00, image: "bugday")
            let product5 = Product(name: "Un", price: 59.00, image: "un")
            self.products.append(product1)
            self.products.append(product2)
            self.products.append(product3)
            self.products.append(product4)
            self.products.append(product5)
            self.productCollectionView.reloadData()
        case .pet:
            let product1 = Product(name: "Kedi Maması", price: 329.00, image: "cat")
            let product2 = Product(name: "Kopek Maması", price: 449.00, image: "dog-food")
            let product3 = Product(name: "Tasma", price: 259.00, image: "tasma")
            let product4 = Product(name: "Oyuncak", price: 199.00, image: "oyuncak")
            self.products.append(product1)
            self.products.append(product2)
            self.products.append(product3)
            self.products.append(product4)
            self.productCollectionView.reloadData()
        case nil:
            break
        }
    }
}

struct Product: Codable{
    let name: String
    let price: Double
    let image: String
}

extension ProductViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! HomeBannerCollectionViewCell
        cell.bindCell(product: self.products[indexPath.row])
        cell.addToCartAction = {
            var basket = ProductManager.shared.loadProducts()
            basket.append(self.products[indexPath.row])
            ProductManager.shared.saveProducts(basket)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "add") as! AddedAlertViewController
            self.present(vc, animated: false)
        }
        return cell
    }
    
}

extension ProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 30 , height: (UIScreen.main.bounds.width / 2) - 30 )
    }
}

class ProductManager {
    static let shared = ProductManager()
    
    private let key = "savedProducts"
    
    private init() {}
    
    func saveProducts(_ products: [Product]) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(products) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
    
    func loadProducts() -> [Product] {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            if let loadedProducts = try? decoder.decode([Product].self, from: savedData) {
                return loadedProducts
            }
        }
        return []
    }
    
    func clearProducts() {
            UserDefaults.standard.removeObject(forKey: key)
        }
}
