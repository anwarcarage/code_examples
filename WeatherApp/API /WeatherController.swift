//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

struct WeatherController {
    let networkService: NetworkService

    init(networkService: NetworkService = NetworkService.default) {
        self.networkService = networkService
    }

    func loadCurrentWeather(city: String, completion: @escaping (ResultType<CurrentWeatherData>) -> Void) {
        networkService.handleRequest(method: .GET, path: "weather", queryParams: ["q": city], body: nil, headers: [:], responseType: CurrentWeatherData.self, completion: completion)
    }

    func loadForecast(city: String, completion: @escaping (ResultType<ForecastData>) -> Void) {
        networkService.handleRequest(method: .GET, path: "forecast", queryParams: ["q": city], responseType: ForecastData.self, completion: completion)
    }

//
//    @objc func callAPI() {
//        let weatherController = WeatherController()
//
//        weatherController.loadForecast(city: "London", completion: { (result: ResultType<ForecastData>) in
//            switch result {
//            case .success(let response):
//                self.handleDataFromAPI(response: response)
//            case .failure(let error):
//                print(error)
//            }
//        })
//    }
//
//    func handleDataFromAPI(response: ForecastData?) {
//        guard let response = response else {
//            return
//        }
//
//        label.text = String(response[0].main.temp) + " K"
//    }

}

