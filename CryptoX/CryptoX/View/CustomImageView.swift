//
//  CustomImageView.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/21/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = true
        
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}
