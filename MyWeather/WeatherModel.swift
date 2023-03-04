//
//  WeatherModel.swift
//  MyWeather
//
//  Created by Austin Suarez on 3/4/23.
//

import Foundation

struct Weather:Identifiable{
    var day:String
    var weatherImg:String
    var temperatureF:Int
    var TemperatureC:Int{(temperatureF-32)*(5/9)}
    var id:String { day }
}
