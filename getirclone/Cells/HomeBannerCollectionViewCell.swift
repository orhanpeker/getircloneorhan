//
//  HomeBannerCollectionViewCell.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit

class HomeBannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: HomeBannerCollectionViewCell!
    
    @IBOutlet weak var containerVieww: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var addToCartAction: () -> Void = {}
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindCell(product: Product)
    {
        self.productImageView.image = UIImage(named: "\(product.image)")
        self.productNameLabel.text = product.name
        self.priceLabel.text = "\(product.price) TL"
    }

    @IBAction func addBasket(_ sender: Any)
    {
        self.addToCartAction()
    }
}
