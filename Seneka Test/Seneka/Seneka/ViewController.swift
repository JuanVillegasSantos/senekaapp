//
//  ViewController.swift
//  GetLocation
//
//  Created by Estudiantes on 2/6/19.
//  Copyright © 2019 Estudiantes. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController ,  CLLocationManagerDelegate{
    
    //Map
    @IBOutlet weak var map: MKMapView!
    let manager = CLLocationManager()
    
    func  locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: 0.002,longitudeDelta: 0.002)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion=MKCoordinateRegion.init(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation=true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



