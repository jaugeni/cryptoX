//
//  CustomCollectionCell.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/21/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setCell(index: Int, type: String) {
     
    }
    
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
