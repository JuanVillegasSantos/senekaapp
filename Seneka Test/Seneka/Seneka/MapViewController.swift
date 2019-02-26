//
//  ViewController.swift
//  Seneka
//
//  Created by Santiago on 12/24/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController ,  CLLocationManagerDelegate, UISearchBarDelegate{
    

    @IBOutlet weak var map: MKMapView!
    //Map
    
    @IBAction func searchButtonMap(_ sender: Any)
    {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.definesPresentationContext = true
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Ignoring users activity
        //UIApplication.shared.beginIgnoringInteractionEvents()
        
        //Loading icon (activity indicator)
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        //Hide search bar when looking for a place
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //Convert String on search bar to search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, Error) in
            if response == nil
            {
                print("Error caused by nil response")
            }
            else
            {
                let newLatitude=response?.boundingRegion.center.latitude
                let newLongitud=response?.boundingRegion.center.longitude
                
                let annotation = MKPointAnnotation()
                annotation.title=searchBar.text
                annotation.coordinate=CLLocationCoordinate2DMake(newLatitude!, newLongitud!)
                self.map.addAnnotation(annotation)
            }
        }
    }
    
    let manager = CLLocationManager()
    
    func  locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: 0.002,longitudeDelta: 0.002)
        let latitude=location.coordinate.latitude
        let longitude=location.coordinate.longitude
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion=MKCoordinateRegion.init(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        self.map.showsUserLocation=true
        print([latitude, longitude]) //latitud= latitude, logitud= logitude
    }
    
    @IBAction func MapsEmergencyButton(_ sender: Any) {
        print("Emergency Button pressed")
        self.performSegue(withIdentifier: "FromMapsToEmergency", sender: self)
    }
    
    
    @IBAction func FromMapsToEmerButton(_ sender: Any) {
        print("Button pressed")
        self.performSegue(withIdentifier: "FromMapsToEmergency", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        print("Map View has loaded")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
}

