//
//  ViewController.swift
//  Seneka
//
//  Created by Santiago on 12/24/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//

import UIKit
import UserNotifications

class MyFlightsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var arrayOfData = [UIImage]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = arrayOfData[indexPath.row]
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        //Adds a navigation Bar to the top of the screen
        _ = self.navigationController?.navigationBar
        navigationController?.navigationBar.isTranslucent = false
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
        arrayOfData += [UIImage(named: "CurrentFlightsAsset.png")!, UIImage(named: "BogTouAsset.png")!, UIImage(named: "FinishedFlightsAsset.png")!, UIImage(named: "CtgBogAsset.png")!, UIImage(named: "BogCtgAsset.png")!, UIImage(named: "FloBogAsset.png")!]
        //Sets a BackButton for the Navigation Bar with a text standing "Back"
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        //Sets the title of the Navigation Bar
        navigationItem.title = "Seneka"
        
        //Sets a Notification inside MyFlights View Controller
        let content = UNMutableNotificationContent()
        content.title = "Updated Status for your flight AF 0429:"
        //content.subtitle = "for your flight AF 0429:"
        content.body = "New GATE 85"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "TestNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        print("Profile View has loaded")
    }
}
