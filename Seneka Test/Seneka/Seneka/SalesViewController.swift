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
        let TopNavBar = self.navigationController?.navigationBar
        navigationController?.navigationBar.isTranslucent = false
        //TopNavBar?.barStyle = UIBarStyle.black
        //self.navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 31/255, green: 32/255, blue: 31/255, alpha: 1)
        //UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 31/255, green: 32/255, blue: 31/255, alpha: 1)
        TopNavBar?.tintColor = UIColor.yellow
        navigationItem.title = "Seneka"
        navigationItem.title.textColor = UIColor.red
        //let titleLabel = UILabel()
        //titleLabel.text = "Seneka"
        //titleLabel.textColor = UIColor.red
        //titleLabel.font = UIFont.systemFontSize(20)
        //navigationItem.titleView = titleLabel
        
    
    }
    
    
}
