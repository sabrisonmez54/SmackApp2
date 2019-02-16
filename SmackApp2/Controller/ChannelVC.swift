//
//  ChannelVC.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/8/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareforUnwind(segue: UIStoryboardSegue){}
    @IBOutlet weak var userImage: CircleImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 100

        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_notif:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
    }
    

   @objc func userDataDidChange(_notif: Notification){
    if AuthService.instance.isLoggedIn{
        loginBtn.setTitle(UserDataService.instance.name, for: .normal)
        userImage.image = UIImage(named: UserDataService.instance.avatarName)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
    }else{
        loginBtn.setTitle("Login", for: .normal)
        userImage.image = UIImage(named: "menuProfileIcon")
        userImage.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn{
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true)
        }else{
                    performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }

        
    }
    

}
