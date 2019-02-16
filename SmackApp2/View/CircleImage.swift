//
//  CircleImage.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/15/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        
    }
    
  
}
