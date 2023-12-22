//
//  BasketTableViewCell.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var deleteBlock: () -> Void = {}
    var priceUpdateBlock: () -> Void = {}
    var priceDownBlock: () -> Void = {}
    
    var count = 1
    var price = 0.0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.countLabel.text = "1"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(product: Product)
    {
        self.productImageView.image = UIImage(named: product.image)
        self.priceLabel.text = "\(product.price)"
        self.productNameLabel.text = product.name
        self.totalLabel.text = "\(product.price * Double(count)) TL"
        self.price = product.price
    }
    
    @IBAction func plusCount(_ sender: Any) {
        
        self.count += 1
        self.totalLabel.text = "\(self.price * Double(count))"
        self.countLabel.text = "\(count)"
        self.priceUpdateBlock()
    }
    @IBAction func minusCount(_ sender: Any) {
        if self.count == 1 {
            self.deleteBlock()
            self.priceDownBlock()
        }
        else
        {
            self.count -= 1
            self.totalLabel.text = "\(self.price * Double(count))"
            self.countLabel.text = "\(count)"
            self.priceDownBlock()
        }
    }
}
