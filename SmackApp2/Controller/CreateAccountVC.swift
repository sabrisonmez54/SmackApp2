//
//  CreateAccountVC.swift
//  SmackApp2
//
//  Created by Sabri on 2/9/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
//Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    //Variables
    var  AvatarName = "profileDefault"
    var  AvatarColor = "[0.5,0.5,0.5,1]" // default gray color rgb
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let email = emailTxt.text , emailTxt.text != "" else{return}
        guard let pass = passTxt.text, emailTxt.text != "" else {return}
        guard let name = usernameTxt.text , usernameTxt.text != "" else{return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success{
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success{
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.AvatarName, avatarColor: self.AvatarColor, completion: { (success) in
                            if success{
                                print(UserDataService.instance.name,UserDataService.instance.avatarName)
                               self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
       performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
}
