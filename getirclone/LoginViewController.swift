//
//  LoginViewController.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var usernameView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.usernameView.addCornerRadius(8)
        self.passwordView.addCornerRadius(8)
        self.buttonLogin.addCornerRadius(8)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        self.login()
    }
    
    
    private func login()
    {
        guard let username = self.usernameText.text,
              let password = self.passwordText.text,
              username != "",
              password != "" else {
            let pm = AlertViewPresentationModel(status: .fail, message: "Bilgiler eksiksiz giriniz.")
            self.showAlert(model: pm)
            return
        }
        
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            
            if error == nil{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "tabbar") as! UITabBarController as UITabBarController
                self?.present(vc, animated: true)
            }
            else
            {
                let pm = AlertViewPresentationModel(status: .fail, message: "Kullanıcı bilgileri hatalı")
                self?.showAlert(model: pm)
            }
        }
    }

}
