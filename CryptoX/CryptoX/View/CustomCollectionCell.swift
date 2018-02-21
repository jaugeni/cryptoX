//
//  CustomCollectionCell.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/21/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit
import SDWebImage

class CustomCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var coinLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setCell(coinInfo: CoinInfo) {
        nameLabel.text = coinInfo.coinName
        coinLogo.sd_setImage(with: URL(string: URL_IMAGE_BASE + coinInfo.imageUrl), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    func setUpView() {
        
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowColor = UIColor(displayP3Red: 175/255, green: 175/255, blue: 175/255, alpha: 1.0).cgColor
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = false
    }
    
}
