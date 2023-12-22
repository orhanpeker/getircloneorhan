//
//  PayViewController.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit

class PayViewController: UIViewController {

    @IBOutlet weak var radio2: UIImageView!
    @IBOutlet weak var radio1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setRadio1ButtonAction()
        self.setRadio2ButtonAction()
    }
    
    private func setRadio1ButtonAction()
    {
        self.radio1.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setChechStatus))
        self.radio1.addGestureRecognizer(tapGesture)
    }
    
    private func setRadio2ButtonAction()
    {
        self.radio2.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setChechStatus2))
        self.radio2.addGestureRecognizer(tapGesture)
    }
    
    @objc func setChechStatus()
    {
        self.radio1.image = UIImage(named: "radio-on")
        self.radio2.image = UIImage(named: "radio-off")
    }
    
    @objc func setChechStatus2()
    {
        self.radio1.image = UIImage(named: "radio-off")
        self.radio2.image = UIImage(named: "radio-on")
    }

    @IBAction func payAction(_ sender: Any) {
        let pm = AlertViewPresentationModel(status: .complete, message: "Sipariş başarılı")
        self.showAlert(model: pm)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
