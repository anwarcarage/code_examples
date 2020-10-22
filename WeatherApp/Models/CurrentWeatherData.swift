//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

struct ForecastData: Codable {
    let cnt: Int
    let city: City
    let list: [DailyWeatherData]
}

struct DailyWeatherData: Codable {
    let main: MainWeather
    let weather: [WeatherData]
    let wind: Wind?
    let dt_txt: String?
}

struct CurrentWeatherData: Codable {
    let id: Int
    let name: String
    let base: String
    let visibility: Int
    let main: MainWeather
    let weather: [WeatherData]
    let coord: Coordinate?
}

struct Coordinate: Codable {
    let lon: Double
    let lat: Double
}

struct MainWeather: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
    let sea_level: Double?  // this denotes that this value may or may not be included in the API JSON response
}

struct WeatherData: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coordinate?
    let country: String?
}

struct Wind: Codable {
    let speed: Double
    let deg: Double
}
