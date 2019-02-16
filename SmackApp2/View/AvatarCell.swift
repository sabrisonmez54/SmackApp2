//
//  AvatarCell.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/15/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    
    func setUpView(){
        
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
    }
}
