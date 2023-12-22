//
//  AddedAlertViewController.swift
//  getirclone
//
//  Created by Orhan Peker on 22.12.2023.
//

import UIKit

class AddedAlertViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.containerView.addCornerRadius(8)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.dismiss(animated: false, completion: nil)
        }
        // Do any additional setup after loading the view.
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
