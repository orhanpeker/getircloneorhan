//
//  AlertViewController.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var labelAlertView: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageViewAlert: UIImageView!
    
    var alertViewPresentationModel: AlertViewPresentationModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerView.addCornerRadius(8)
        self.labelAlertView.text = alertViewPresentationModel?.message
        
        if self.alertViewPresentationModel?.status == .success
        {
            self.imageViewAlert.image = UIImage(named: "success")
        }
        else if self.alertViewPresentationModel?.status == .fail
        {
            self.imageViewAlert.image = UIImage(named: "error")
        }
        else
        {
            self.imageViewAlert.image = UIImage(named: "success")
        }
        
    }
    @IBAction func actionButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
}

class AlertViewPresentationModel {
    let status: AlertStatus
    let message: String
    
    init(status: AlertStatus, message: String) {
        self.status = status
        self.message = message
    }
}

enum AlertStatus {
    case success
    case fail
    case complete
}

extension UIViewController
{
    func showAlert(model: AlertViewPresentationModel){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "alert") as! AlertViewController
        vc.alertViewPresentationModel = model
        self.present(vc, animated: false)
    }
}
