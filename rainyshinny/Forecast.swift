//
//  Forecase.swift
//  rainyshinny
//
//  Created by Romeo Enso on 10/08/2017.
//  Copyright © 2017 Romeo Enso. All rights reserved.
//

import UIKit

class Forecast {
    
    var _date: String!
    var _lowTemp: String!
    var _highTemp: String!
    var _weatherType: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvinToFarenPreDivision = (min * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenPreDivision/10))
                self._lowTemp = "\(kelvinToFarenheit)"
            }
            if let max = temp["max"] as? Double {
                let kelvinToFarenPreDivision = (max * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenPreDivision/10))
                self._highTemp = "\(kelvinToFarenheit)"
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        if let date = weatherDict["dt"] as? Double {
            let unixConvertDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertDate.dayOfTheWeek()

        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
