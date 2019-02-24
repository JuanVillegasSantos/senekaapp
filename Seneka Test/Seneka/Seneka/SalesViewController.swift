//
//  Log In.swift
//  Seneka
//
//  Created by Santiago on 12/28/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//
import UIKit
//class SalesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
class SalesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var arrayOfStores = [UIImage]()
    var arrayOfIDs = ["Store1", "Store2",]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfStores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
       
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = arrayOfStores[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = arrayOfIDs[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        //Adds a navigation Bar to the top of the screen
        _ = self.navigationController?.navigationBar
        navigationController?.navigationBar.isTranslucent = false
        //Adds a title to the Navigation Bar
        navigationItem.title = "Seneka"
        //Sets the color of the Navigation Bar text its font type
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-Heavy", size: 30) as Any,
        ]
        //Sets the color of the Navigation Bar
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 100/225, green: 197/255, blue: 213/255, alpha: 1)
    }
    //Connects button to ViewController
    @IBAction func FromStoresToEmerButton(_ sender: Any) {
        print("Emergency Button pressed")
        self.performSegue(withIdentifier: "FromStoresToEmergencySergue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayOfStores += [UIImage(named: "VeggieFoodAsset.png")!, UIImage(named: "CafeAsset.png")!, UIImage(named: "SouvenirAsset.png")!, UIImage(named: "JewerlyAsset.png")!, UIImage(named: "BarAsset.png")!, UIImage(named: "MoneyAsset.png")!, UIImage(named: "DutyAsset.png")!, UIImage(named: "CookiesAsset.png")!]
        arrayOfIDs = ["Store1","Store2"]
        
        print ("Stores View has loaded")
        
    }
    
}
