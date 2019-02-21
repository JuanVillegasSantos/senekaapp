//
//  ViewController.swift
//  Seneka
//
//  Created by Santiago on 12/24/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBAction func SignInButton(_ sender: Any) {
        print("Button pressed")
        self.performSegue(withIdentifier: "SalesViewSergue", sender: self)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Sign View has loaded")
        
        
    }


}

