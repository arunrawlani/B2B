//
//  Service.swift
//  AngelHacks
//
//  Created by Essam Ewaisha on 8/1/15.
//  Copyright (c) 2015 Essam Ewaisha. All rights reserved.
//

import Foundation
import MapKit
class Service {
    //Searching method
    //WARNING since the tags and sectors are of the same type the tags parameter should contain both tags and sectors
    func search(tags: [String], name: String, location: Location, searchRadius: Double, userLocation: CLLocationCoordinate2D){
        var allBuisnesses: [Business] = getBusiness()
        //WARNING check if it actually mutatates the object
        //TODO reimpelemnt when errors are gone
        
        // filtering by name         // filtering by location
        // filtering by tags and sector
        allBuisnesses.filter { (T:Business) -> Bool in
            T.name == name
            }
        allBuisnesses.filter { (T:Business) -> Bool in
        T.location.isInRange(userLocation, rangeInMeters: searchRadius) ?? false
        }
        allBuisnesses.filter { (T:Business) -> Bool in
           self.foundTag(tags, objectTags: T.tags)
        }

    
        
    }
    private func getBuissnessWithName(allBuisness: [Business], name:String) -> [Business]{
        var returnArray = [Business]()
        for buisness in allBuisness {
            if buisness.name == name {
                returnArray.append(buisness)
                
            }
        }
        return returnArray
    }
    private func get(allBuisness: [Business], name:String) -> [Business]{
        var returnArray = [Business]()
        for buisness in allBuisness {
            if buisness.name == name {
                returnArray.append(buisness)
                
            }
        }
        return returnArray
    }
    private func foundTag(tags: [String], objectTags: [String]) -> Bool {
        // TODO Use better comparison
        for tag in tags {
            for objectTag in objectTags {
                //if (tag.localizedCaseInsensitiveCompare(objectTag)){
                    return true
               // }
            }
        }
        return false
    }
    
    private func getBusiness () -> [Business]{
        return [Business]()
    }
    
}