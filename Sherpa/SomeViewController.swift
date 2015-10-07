//
//  SomeViewController.swift
//  Sherpa
//
//  Created by Amit Mondal on 9/3/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

import UIKit
import Parse
import Foundation
import CoreLocation
import MapKit

class SomeViewController: UIViewController, CLLocationManagerDelegate{
    //array of Business objects returned by the query that are within location
    var businessArray: [Business] = []
    
    //CLLocationManager to get current location
    var locationManager = CLLocationManager()
    
    //Stores user's current location = use in the searchParseWithGeoPoint method
    var currentLocationGeoPoint: PFGeoPoint? {
        didSet {
            //call some method that uses the user's location - any method using the user's currentLocation should be called from here, otherwise it might be nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if we can use user's location
        self.checkLocationAuthorizationStatus()
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            self.locationManager.startUpdatingLocation()
        }
        
        //set locationManager delegate
        self.locationManager.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //variable to store result of getLocationFromString query
    var parseGeoPoint: PFGeoPoint? {
        didSet {
            //This gets set whenever getLocationFromString is called
            //Set a Business object's location here
        }
    }
    
    //method that gets Businesses from Parse
    func searchParseWithGeoPoint(distanceInMiles: Double, userGeoPoint: PFGeoPoint) {
        //assumes the object class name is Business
        let businessesQuery = PFQuery(className: "Business")
        //loads Business objects based on proximity to current location with the whereKey method
        //also assumes that each Business object has a PFGeoPoint property called "location"
        businessesQuery.whereKey("location", nearGeoPoint: userGeoPoint, withinMiles: distanceInMiles)
        
        businessesQuery.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
            self.businessArray = result as? [Business] ?? []
            //Do anything else you need to with the array of Business objects
        }
    }
    
    
    
    //Use this to assign a GeoPoint to a business given its city and state
    func getLocationFromString(city: String, state: String) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "\(city), \(state)"
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { (response: MKLocalSearchResponse?, error: NSError?) -> Void in
            if error != nil {
                print("Error occured in search: \(error!.localizedDescription)")
            } else if response!.mapItems.count == 0 {
                print("No matches found")
            } else {
                let coordinate =  (response!.mapItems[response!.mapItems.count-1] as! MKMapItem).placemark.coordinate
                let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                //global variable parseGeoPoint contains newly found location coordinate
                self.parseGeoPoint = PFGeoPoint(location: location)
            }
        }
    }
    
    //check if user allows app to get current location
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            //mapView.myLocationEnabled = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //sets the global variable "currentLocationGeoPoint" that stores the user's current location
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var coordinate : CLLocationCoordinate2D = manager.location!.coordinate
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        self.currentLocationGeoPoint? = PFGeoPoint(location: location)
        self.locationManager.stopUpdatingLocation()
    }

}
