//
//  Log In.swift
//  Seneka
//
//  Created by Santiago on 12/28/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//

import UIKit

class EmergencyFromMapViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var arrayOfEmergencies = [UIImage]()
    var arrayOfIDs = ["Police", "HealthServices","AirportSecurity"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfEmergencies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "securityCell", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = arrayOfEmergencies[indexPath.row]
        
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
    
    
    @IBAction func FromEmerToMaps(_ sender: Any) {
        print("Button pressed")
        self.performSegue(withIdentifier: "FromEmerToMaps", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfEmergencies += [UIImage(named: "PoliceCallAsset.png")!, UIImage(named: "MedicalAsset.png")!, UIImage(named: "AirportSecAsset.png")!]
        arrayOfIDs = ["Police", "HealthServices","AirportSecurity"]
        
        print ("Emergency View has loaded")
    }
    
}
