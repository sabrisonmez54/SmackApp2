//
//  AvatarCell.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/15/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

enum AvatarType{
    case dark
    case light
    }

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func configureCell(index:Int, type:AvatarType) {
        if type == AvatarType.dark{
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
            avatarImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
