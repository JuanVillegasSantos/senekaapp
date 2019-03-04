//
//  ViewController.swift
//  Seneka
//
//  Created by Santiago on 12/24/18.
//  Copyright © 2018 Seneka Inc. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController ,  CLLocationManagerDelegate, UISearchBarDelegate{
    
    let manager = CLLocationManager()
    var location: CLLocation?
    //var isUpdatingLocation = false
    //var lastLocationError: Error?
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var map: MKMapView!
    //Map_iOS, for searching
    
    func  locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        //let span:MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: 0.002,longitudeDelta: 0.002)
        let latitude=location.coordinate.latitude
        let longitude=location.coordinate.longitude
        //let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        //let region: MKCoordinateRegion=MKCoordinateRegion.init(center: myLocation, span: span)
        //map.setRegion(region, animated: true)
        //self.map.showsUserLocation=true
        print([latitude, longitude]) //latitud= latitude, logitud= logitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 18)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.map = mapView
    }
    
    func reportLocationServiceDeniedError()
    {
        let alert = UIAlertController(title: "Location Disabled", message: "Set Location", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func RequireButton(_ sender: Any) {
        self.performSegue(withIdentifier: "FromMapToRequire", sender: self)
    }
    
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
    @IBAction func MapsEmergencyButton(_ sender: Any) {
        print("Emergency Button pressed")
        self.performSegue(withIdentifier: "FromMapsToEmergency", sender: self)
    }
    
    
    @IBAction func FromMapsToEmerButton(_ sender: Any) {
        print("Button pressed")
        self.performSegue(withIdentifier: "FromMapsToEmergency", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyBSVeHyh9xhJ3FzFbtVKO8aMmAywEeFce4")
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        //Sets the title of Navigation Bar
        navigationItem.title = "Seneka"
        
        print("Map View has loaded")
    }
    
    
}

