//
//  ViewController.swift
//  Seneka
//
//  Created by Santiago on 12/24/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//

import UIKit
import UserNotifications

class SignInViewController: UIViewController {
    
    @IBAction func SignInButton(_ sender: Any) {
        print("Button pressed")
        self.performSegue(withIdentifier: "SalesViewSergue", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let content = UNMutableNotificationContent()
        content.title = "Updated Status for your flight AF 0429:"
        //content.subtitle = "for your flight AF 0429:"
        content.body = "New GATE 85"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        let request = UNNotificationRequest(identifier: "TestNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

        print("View has loaded")
        
    }
}
