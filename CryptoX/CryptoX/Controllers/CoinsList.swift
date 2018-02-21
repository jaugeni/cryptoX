//
//  CoinsList.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/20/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit


class CoinsList: UIViewController {

    @IBOutlet weak var coinCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        coinCollection.delegate = self
        coinCollection.dataSource = self
    }



}

extension CoinsList: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CustomCollectionCell {
            return cell
        }
        return CustomCollectionCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCollums: CGFloat = 2
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimention = ((collectionView.bounds.width - padding) - (numberOfCollums - 1) * spaceBetweenCells) / numberOfCollums
        return CGSize(width: cellDimention, height: cellDimention)
        
    }

}

