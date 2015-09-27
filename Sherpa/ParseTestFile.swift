//
//  ParseTestFile.swift
//  Sherpa
//
//  Created by Amit Mondal on 9/3/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

import Foundation
import Parse
import CoreLocation


var businesses: [Business] = []
func searchParse(distanceInMiles: Double, geoPoint: PFGeoPoint) {
    //assumes the object class name is Business
    let businessesQuery = PFQuery(className: "Business")
    //loads Business objects based on proximity to current location with the whereKey method
    //also assumes that each Business object has a PFGeoPoint property called "location"
    businessesQuery.whereKey("location", nearGeoPoint: geoPoint, withinMiles: distanceInMiles)
    
    businessesQuery.findObjectsInBackgroundWithBlock { (result: [AnyObject]?, error: NSError?) -> Void in
        businesses = result as? [Business] ?? []
        //Do anything else you need to with the array of Business objects
    }
}
