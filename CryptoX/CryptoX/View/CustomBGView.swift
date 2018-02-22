//
//  CustomBGView.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/21/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class CustomBGView: UIView {
    
    override func layoutSubviews() {
        
        let topColor = #colorLiteral(red: 0.1321582198, green: 0.4862704277, blue: 0.758523643, alpha: 1)
        
        let bottonColor = #colorLiteral(red: 0.06666666667, green: 0.7725490196, blue: 0.8274509804, alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottonColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
