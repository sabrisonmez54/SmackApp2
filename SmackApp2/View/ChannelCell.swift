//
//  ChannelCell.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/17/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var channelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //changing background  of selected channel
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected{
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel){
        let title = channel.channelTitle ?? ""
        channelName.text = "#\(title)"
        channelName.font = UIFont(name: "Avenir-Book", size: 17)
        
        for id in MessageService.instance.unreadChannels{
            if id == channel.id{
                channelName.font = UIFont(name: "Avenir-Heavy", size: 22)
            }
        }
    }
}
