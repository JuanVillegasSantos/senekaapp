//
//  ViewController.swift
//  GetLocation
//
//  Created by Estudiantes on 2/6/19.
//  Copyright © 2019 Estudiantes. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController ,  CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()
    

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
        
            locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    }


