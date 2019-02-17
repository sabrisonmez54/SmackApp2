//
//  AddChannelVC.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/17/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    //Outlets
    
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var chanDesc: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    
    }

    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createChannelPressed(_ sender: Any) {
    }
    
    func setUpView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_recognizer:)))
        bgView.addGestureRecognizer(closeTouch)
        
    }
    
    @objc func closeTap(_recognizer: UITapGestureRecognizer){
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
