//
//  Location.swift
//  AngelHacks
//
//  Created by Essam Ewaisha on 8/1/15.
//  Copyright (c) 2015 Essam Ewaisha. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
class Location {
    var city: String = ""
    var state: String = ""
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
    init (city: String, state: String) {
        self.city = city
        self.state = state
    }
    func assignLocation() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "\(self.city), \(self.state)"
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { (response: MKLocalSearchResponse?, error: NSError?) -> Void in
            if error != nil {
                print("Error occured in search: \(error!.localizedDescription)")
            } else if response!.mapItems.count == 0 {
                print("No matches found")
            } else {
                self.location = (response!.mapItems[response!.mapItems.count-1] as! MKMapItem).placemark.coordinate
            }
            
        }
    }
    func isInRange(rangeInMeters: Double) -> Bool {
        var userLocation = CLLocationCoordinate2D(latitude: 37.76, longitude: -122.39)
        var thisLocation = CLLocation(latitude: self.location.latitude, longitude: self.location.longitude)
        var thatLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        var distance: Double = thisLocation.distanceFromLocation(thatLocation)
        return distance < rangeInMeters
    }
}