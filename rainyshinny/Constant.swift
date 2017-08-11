//
//  Constant.swift
//  rainyshinny
//
//  Created by Romeo Enso on 08/08/2017.
//  Copyright © 2017 Romeo Enso. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "b1b15e88fa797225412429c1c50c122a1"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"
typealias DownloadComplete = () -> ()
let FORECAST_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=b1b15e88fa797225412429c1c50c122a1"

