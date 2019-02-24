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
    var arrayOfIDs = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfStores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
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
        arrayOfStores = [TorreConAvionNubes,ProfileAsset]
        arrayOfIDs = ["Store1","Store2"]
        
        //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        print ("Stores View has loaded")
        
    }
    
    //override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    //    return 5
    //}
    
    //override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath)
    //    cell.backgroundColor = UIColor.red
    //    return cell
    //}
}
