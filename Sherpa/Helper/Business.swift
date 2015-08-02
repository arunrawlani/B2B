//
//  Business.swift
//  AngelHacks
//
//  Created by Essam Ewaisha on 8/1/15.
//  Copyright (c) 2015 Essam Ewaisha. All rights reserved.
//

import Foundation
class Business {
    var tags: [String] = []
    var name: String = ""
    var sectors = [String]()
    var location: Location
    var legalValidation: Bool
    var reviews = [Review]()
    init(name: String, tags: [String], sectors: [String],legalValidation:Bool,city:String, state: String, reviews:[Review]){
        self.location = Location(city: city, state: state)
        self.tags = tags
        self.sectors = sectors
        self.reviews = reviews
        self.legalValidation = legalValidation
    }
}