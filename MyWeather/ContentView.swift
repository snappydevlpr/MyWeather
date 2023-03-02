//
//  ContentView.swift
//  MyWeather
//
//  Created by Austin Suarez on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false;
    var body: some View {
        ZStack{
            // goes from the top left to bottom right
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Dallas, Texas")
                CurrentWeather(imageName:isNight ? "cloud.moon.fill": "cloud.sun.fill",
                               temperature: 76)
                HStack(spacing:20){
                    WeatherDayView(dayOfTheWeek: "TUE",
                                   imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfTheWeek: "WED",
                                   imageName: isNight ? "moon.fill" : "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfTheWeek: "THUR",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfTheWeek: "FRI",
                                   imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfTheWeek: "SAT",
                                   imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                   temperature: 25)
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  buttonBackgroundColor: .white)
                }
                Spacer()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfTheWeek:String
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack(spacing: 10){
            Text(dayOfTheWeek)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight:Bool;

    var body: some View {
        
        LinearGradient(gradient: Gradient(colors:[isNight ? .indigo:.blue,
                                                  isNight ? .purple:Color("lightBlue")]), startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView:View{
    var cityName:String;
    var body: some View{
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeather:View{
    var imageName:String
    var temperature:Int;
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}

