//
//  ViewController.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.toolbar.tintColor = .white
    }

    @IBAction func loginAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

