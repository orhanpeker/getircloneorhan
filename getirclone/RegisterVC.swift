//
//  RegisterVC.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var rePasswordTextView: UIView!
    @IBOutlet weak var passwordTextView: UIView!
    @IBOutlet weak var nameTextView: UIView!
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var checkButton: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonPasswordShow: UIButton!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var buttonRePasswordShow: UIButton!
    @IBOutlet weak var mailTextField: UITextField!
    
    var checkStatus = false

    override func viewDidLoad() {
        super.viewDidLoad()

        self.prepareUI()
        self.setRadioButtonAction()
    }
    
    private func prepareUI()
    {
        self.nameTextView.layer.cornerRadius = 8
        self.nameTextView.addCornerRadius(8)
        self.passwordTextView.addCornerRadius(8)
        self.rePasswordTextView.addCornerRadius(8)
        self.buttonRegister.addCornerRadius(8)
        self.passwordTextField.isSecureTextEntry = true
        self.rePasswordTextField.isSecureTextEntry = true
    }
    
    @IBAction func actionButton(_ sender: Any)
    {
        self.registerUser()
    }
    
    @IBAction func passwordShowHideAction(_ sender: Any) {
        let selectedImage = self.buttonPasswordShow.currentImage
        
        if selectedImage == UIImage(named: "show")
        {
            self.buttonPasswordShow.setImage(UIImage(named: "hide"), for: .normal)
            self.passwordTextField.isSecureTextEntry = false
        }
        else
        {
            self.buttonPasswordShow.setImage(UIImage(named: "show"), for: .normal)
            self.passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func rePasswordShowHideAction(_ sender: Any) {
        let selectedImage = self.buttonRePasswordShow.currentImage
        
        if selectedImage == UIImage(named: "show")
        {
            self.buttonRePasswordShow.setImage(UIImage(named: "hide"), for: .normal)
            self.rePasswordTextField.isSecureTextEntry = false
        }
        else
        {
            self.buttonRePasswordShow.setImage(UIImage(named: "show"), for: .normal)
            self.rePasswordTextField.isSecureTextEntry = true
        }
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func setRadioButtonAction()
    {
        self.checkButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setChechStatus))
        self.checkButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func setChechStatus()
    {
        let isStatusChecked = self.checkStatus
        let imageOff = UIImage(named: "radio-off")
        let imageOn = UIImage(named: "radio-on")
        
        if isStatusChecked {
            self.checkButton.image = imageOff
            self.checkStatus = false
        }
        else
        {
            self.checkButton.image = imageOn
            self.checkStatus = true
        }
    }
}


extension UIView {
    func addCornerRadius(_ radius: CGFloat)
    {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}


// MARK: Firebase

extension RegisterVC
{
    private func registerUser()
    {
        guard
            self.mailTextField.text != "",
            self.passwordTextField.text != "",
            self.rePasswordTextField.text != "",
            self.isValidEmail(email: self.mailTextField.text ?? ""),
            self.checkStatus == true else {
            let alertViewPM = AlertViewPresentationModel(status: .fail, message: "Bilgilerinizi Kontrol Ediniz")
            self.showAlert(model: alertViewPM)
            return
            }
        Auth.auth().createUser(withEmail: self.mailTextField.text!, password: self.passwordTextField.text!) { result, err in
            if err == nil
            {
                let alertPM = AlertViewPresentationModel(status: .success, message: "Hesap başarıyla oluşturuldu.")
                self.showAlert(model: alertPM)
            }
            else
            {
                let alertPM = AlertViewPresentationModel(status: .fail, message: err?.localizedDescription.lowercased() ?? "")
                self.showAlert(model: alertPM)
            }
        }
    }
}
