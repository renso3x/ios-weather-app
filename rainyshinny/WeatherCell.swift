//
//  WeatherCell.swift
//  rainyshinny
//
//  Created by Romeo Enso on 11/08/2017.
//  Copyright © 2017 Romeo Enso. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    
    func configureCell(forecast: Forecast) {
        dayLabel.text = forecast.date
        lowTempLbl.text = "\(forecast.lowTemp)"
        highTemLbl.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        weatherImage.image = UIImage(named: forecast.weatherType)
    }
}
