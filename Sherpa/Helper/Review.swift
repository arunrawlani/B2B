//
//  Review.swift
//  AngelHacks
//
//  Created by Essam Ewaisha on 8/1/15.
//  Copyright (c) 2015 Essam Ewaisha. All rights reserved.
//

import Foundation
class Review {
    var rating: Int = 0
    var description: String
    init(rating: Int, description: String) {
        self.rating = rating
        self.description = description
    }
}