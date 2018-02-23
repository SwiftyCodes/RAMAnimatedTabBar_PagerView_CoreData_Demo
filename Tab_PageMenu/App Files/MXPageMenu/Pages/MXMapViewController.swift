//
//  MXMapViewController.swift
//  Tab_PageMenu
//
//  Created by Anurag on 22/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MXMapViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialiseValues()

    }
    
    func initialiseValues() {
 
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            self.locationManager.startUpdatingLocation()
            
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
   
        let userLocation:CLLocation = locations[0] as CLLocation
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion (center:  location,span: span)
        mapView.setRegion(region, animated: true)
        
    }

    
}

