//
//  CoinsList.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/20/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit


class CoinsListVC: UIViewController {
    
    @IBOutlet weak var coinCollection: UICollectionView!
    
    var pickedCoin = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        coinCollection.delegate = self
        coinCollection.dataSource = self
        demoData()
    }
    
    func demoData() {
        DataService.share.getCoinBaseInfo(coinSymbol: "BTC", convertTo: "USD") { (status) in
            if status {
                self.coinCollection.reloadData()
            }
        }
        DataService.share.getCoinBaseInfo(coinSymbol: "ETH", convertTo: "USD") { (status) in
            if status {
                self.coinCollection.reloadData()
            }
        }
        DataService.share.getCoinBaseInfo(coinSymbol: "LTC", convertTo: "USD") { (status) in
            if status {
                self.coinCollection.reloadData()
            }
        }
        DataService.share.getCoinBaseInfo(coinSymbol: "TRX", convertTo: "USD") { (status) in
            if status {
                self.coinCollection.reloadData()
            }
        }
        DataService.share.getCoinBaseInfo(coinSymbol: "XRP", convertTo: "USD") { (status) in
            if status {
                self.coinCollection.reloadData()
            }
        }
        DataService.share.getCoinBaseInfo(coinSymbol: "DASH", convertTo: "USD") { (status) in
            if status {
                self.coinCollection.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? TwitterVC {
                
                destination.namePicked = pickedCoin
            }
    
    }
    
    
    
}

extension CoinsListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.share.myCoins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CustomCollectionCell {
            
            cell.setCell(coinInfo: DataService.share.myCoins[indexPath.row])
            
            return cell
        }
        return CustomCollectionCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCollums: CGFloat = 2
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimention = ((collectionView.bounds.width - padding) - (numberOfCollums - 1) * spaceBetweenCells) / numberOfCollums
        return CGSize(width: cellDimention, height: cellDimention )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pickedCoin = DataService.share.myCoins[indexPath.row].coinName
        performSegue(withIdentifier: SEGUE_TO_TWITTER, sender: collectionView)
        
    }
    
    
    
}

