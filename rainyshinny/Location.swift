//
//  Location.swift
//  rainyshinny
//
//  Created by Romeo Enso on 11/08/2017.
//  Copyright © 2017 Romeo Enso. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
