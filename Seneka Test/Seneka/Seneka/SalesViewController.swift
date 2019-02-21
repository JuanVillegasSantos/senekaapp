//
//  Log In.swift
//  Seneka
//
//  Created by Santiago on 12/28/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//

import UIKit

class SalesViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 31/255, green: 32/255, blue: 31/255, alpha: 1)
        
        print ("View has loaded")
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        _ = self.navigationController?.navigationBar
        navigationController?.navigationBar.isTranslucent = false
        
        //TopNavBar?.tintColor = UIColor.yellow
        navigationItem.title = "Seneka"
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-Heavy", size: 30) as Any,
        ]
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 100/225, green: 197/255, blue: 213/255, alpha: 1)
        
        
    }
    
    
}
