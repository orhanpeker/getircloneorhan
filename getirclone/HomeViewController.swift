//
//  HomeViewController.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var section6: UIButton!
    @IBOutlet weak var section5: UIButton!
    @IBOutlet weak var section4: UIButton!
    @IBOutlet weak var section3: UIButton!
    @IBOutlet weak var section2: UIButton!
    @IBOutlet weak var section1: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func actionSection1(_ sender: Any) 
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productScreen") as! ProductViewController
        vc.categoryType = .food
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionSection2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productScreen") as! ProductViewController
        vc.categoryType = .drink
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionSection3(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productScreen") as! ProductViewController
        vc.categoryType = .milk
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionSection4(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productScreen") as! ProductViewController
        vc.categoryType = .clean
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionSection5(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productScreen") as! ProductViewController
        vc.categoryType = .bread
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionSection6(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productScreen") as! ProductViewController
        vc.categoryType = .pet
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

enum Category
{
    case food
    case drink
    case milk
    case clean
    case bread
    case pet
}
