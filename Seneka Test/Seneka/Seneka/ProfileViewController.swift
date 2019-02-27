//
//  ViewController.swift
//  Seneka
//
//  Created by Santiago on 12/24/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var arrayOfData = [UIImage]()
    var arrayOfDataIDs = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = arrayOfData[indexPath.row]
        
        return cell
    }
    //Configure Button to go to desired Asset
    @IBAction func FromProfileToEmerButton(_ sender: Any) {
        print("Button pressed")
        self.performSegue(withIdentifier: "FromProfileToEmer", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        //Adds a navigation Bar to the top of the screen
        _ = self.navigationController?.navigationBar
        navigationController?.navigationBar.isTranslucent = false
        
        //navigationItem.title = "Seneka"
        //Sets the color of the Navigation Bar text its font type
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-Heavy", size: 30) as Any,
        ]
        //Sets the color of the Navigation Bar
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 100/225, green: 197/255, blue: 213/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Adds the assets to the Collection Controller
        arrayOfData += [UIImage(named: "ProfileLineAsset.png")!, UIImage(named: "PersonalInfoLabelAsset.png")!, UIImage(named: "AgeAsset.png")!, UIImage(named: "GenderAsset.png")!, UIImage(named: "NationalityInfoAsset.png")!, UIImage(named: "IDNumberAsset.png")!, UIImage(named: "PassportNumberAsset.png")!, UIImage(named: "MedicalInfoAsset.png")!, UIImage(named: "BloodTypeAsset.png")!, UIImage(named: "WeightAsset.png")!, UIImage(named: "HeightAsset.png")!, UIImage(named: "WhiteAsset.png")!]
        arrayOfDataIDs = ["Store1","Store2"]
        //Sets the title of the Navigation Bar
        navigationItem.title = "Seneka"
        
        print("Profile View has loaded")
    }
    
}
