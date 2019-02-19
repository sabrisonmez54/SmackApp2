//
//  customButtons.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/13/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class CustomButtons: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = #colorLiteral(red: 0, green: 0.3294117647, blue: 0.5764705882, alpha: 1)
        layer.cornerRadius = 10.0
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.shadowColor = #colorLiteral(red: 0.4745098039, green: 0.8392156863, blue: 0.9764705882, alpha: 1)
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5.0
    }
}
