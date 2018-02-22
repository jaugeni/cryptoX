//
//  MyTableViewCell.swift
//  CryptoX
//
//  Created by Sirak Zeray on 2/21/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myTextView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
