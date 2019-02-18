//
//  ChatVC.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/8/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //outlets
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var channelNameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
       
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.UserDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNELS_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn{
            AuthService.instance.findUserByEmail { (success) in
                if success{
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                }
            }
        }
    }
    
    @objc func channelSelected(_ notif: Notification){
       updateWithChannel()
    }
    
    func updateWithChannel(){
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = "#\(channelName)"
        getMessages()
    }
    
    @objc func UserDataDidChange(_ notif: Notification){
        if AuthService.instance.isLoggedIn{
            //getChannels
            onLoginGetMessages()
        }else{
            channelNameLbl.text = "Please Login"
        }
    }
    
    func onLoginGetMessages(){
        MessageService.instance.findAllChannel { (success) in
            if success{
                //Do stuff with channels
                //check for channel
                if MessageService.instance.channels.count > 0{
                    //sets channel as the first
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                }else{
                    self.channelNameLbl.text = "No Channels yet..."
                }
            }
        }
    }
    
    func getMessages() {
        guard let channelId = MessageService.instance.selectedChannel?.id else{return}
        MessageService.instance.findAllMessagesForChannel(channelId: channelId) { (success) in
            
        }
    }

}
