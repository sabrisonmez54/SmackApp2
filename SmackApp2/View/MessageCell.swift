//
//  MessageCell.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/18/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    //Outlets
    
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    func configureCell(message: Message){
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: message.timeStamp)
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        guard let dateUnwrapped = date else { return }
        timeStampLbl.text = dateFormatter.string(from: dateUnwrapped)
    } 
}
