//
//  TwitterVC.swift
//  CryptoX
//
//  Created by Sirak Zeray on 2/20/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class TwitterVC: UIViewController, UITabBarDelegate, UITableViewDataSource ,UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet weak var pickerOutlet: UIPickerView!
    
    
    
    var tweet : [String] = []
    
    func getArray (dictonaryName : [String : String])-> [String]{
        let pickedkey =  Array(dictonaryName.keys)
        
        return pickedkey
        
        
    }
    
    
    
    let famousCyrpto = ["Bitcoin", "Ripple", "Litcoin", "Dash", "Etherum", "Tron"]
    let bg = ["Red", "Blu", "Green"]
    
    let bitcoin = ["Coinbase" : "https://twitter.com/coinbase","Bitcoin News" : "https://twitter.com/BTCTN", "Bitcoin Foundation" : "https://twitter.com/BTCFoundation"]
    let ripple = ["Ripple Main":"https://twitter.com/Ripple", "Brad Garling/Ceo":"https://twitter.com/bgarlinghouse" , "Binace":"https://twitter.com/binance_2017"]
    let litcoin = ["Charlie Lee/Creator":"https://twitter.com/SatoshiLite", "Litcoin News":"https://twitter.com/LiteCoinNews","Litcoin Market":"https://twitter.com/LitecoinMarket1"]
    let dash = ["Dashcoin":"https://twitter.com/DashCoinDSH" , "Binace":"https://twitter.com/binance_2017"]
    let ethereum = ["Ethereum/Verified":"https://twitter.com/ethereumproject", "Ethereum Classics":"https://twitter.com/EthereumClassic", "":""]
    let tron = ["Tron Foundation/Verified" :"https://twitter.com/Tronfoundation", "Justin Sun/ Founder":"https://twitter.com/justinsuntron"]
    
    
    
    
    var pickerData = [[String]()]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        pickerOutlet.dataSource = self
        pickerOutlet.delegate = self
        
        
        
        
       
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return getArray(dictonaryName: litcoin).count

        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        return getArray(dictonaryName: litcoin)[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    
        let nameOfPicked = getArray(dictonaryName: litcoin)[row]
        
        getStuff(pickTwitter: litcoin[nameOfPicked]!)
        
        
        
        
        
        
    }
    
    
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath) as! MyTableViewCell
        cell.myTextView.text = tweet[indexPath.row]
        return cell
    }
    
//    @IBAction func search(_ sender: Any) {
//        
//        if myTextField.text?.isEmpty == false {
//            let user = myTextField.text?.replacingOccurrences(of: " ", with: "")
//            getStuff(user: user!)
//            
//        }
//    }
    
    func getStuff(pickTwitter : String) {
        
        let url = URL(string: pickTwitter)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    if let errorMessage = error?.localizedDescription {
                        self.myLabel.text = errorMessage
                    }else {
                        self.myLabel.text = "There has been an error try again"
                    }
                }
                
            } else
            {
                let webContent : String = String(data: data!, encoding : String.Encoding.utf8)!
                
                var array : [String] = webContent.components(separatedBy: "<title>")
                array = array[1].components(separatedBy: " |")
                let name = array[0]
                array.removeAll()
                array = webContent.components(separatedBy: "data-resolved-url-large=\"")
                array = array[1].components(separatedBy: "\"")
                let profilePicture = array[0]
                
                array = webContent.components(separatedBy: "data-aria-label-part=\"0\">")
                array.remove(at: 0)
                
                for i in 0...array.count-1{
                    let newTweet = array[i].components(separatedBy: "<")
                    array[i] = newTweet[0]
                }
                self.tweet = array
                
                DispatchQueue.main.async {
                    self.myLabel.text = name
                    self.updateImage(url: profilePicture)
                    self.myTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    
    func updateImage(url : String) {
        let url = URL(string: url)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                self.myImageView.image = UIImage(data : data!)
            }
        }
        task.resume()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
