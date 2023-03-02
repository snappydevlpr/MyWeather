//
//  WeatherButton.swift
//  MyWeather
//
//  Created by Austin Suarez on 3/1/23.
//
import SwiftUI
struct WeatherButton:View{
    var title:String
    var textColor:Color
    var buttonBackgroundColor:Color
    
    var body: some View{
        Text(title)
        .frame(width: 280,height: 50)
        .foregroundColor(textColor)
        .background(buttonBackgroundColor)
        .font(.system(size:    20,weight: .bold,design: .default))
        .cornerRadius(10)
    }
}
