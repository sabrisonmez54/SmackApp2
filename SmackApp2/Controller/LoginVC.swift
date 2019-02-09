//
//  LoginVC.swift
//  SmackApp2
//
//  Created by Sabri on 2/8/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
    }

    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    

}
