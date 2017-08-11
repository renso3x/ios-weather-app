//
//  CurrentWeather.swift
//  rainyshinny
//
//  Created by Romeo Enso on 09/08/2017.
//  Copyright © 2017 Romeo Enso. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetail(completed: @escaping DownloadComplete) {
        let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherUrl).responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//            
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
        
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name
                    print (self._cityName)
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                        print (self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemp = main["temp"] as? Double {
                        let kelvinToFarenPreDivision = (currentTemp * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenPreDivision/10))
                        
                        self._currentTemp = kelvinToFarenheit
                    }
                }
            }
            completed()
        }
    }
}
