//
//  ExampleRouter.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/28/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation


// handles database calls and can handle api calls and it can handle push notifications and all sorts of stuff
class ExampleRouter {

    init() {
        // setup dependencies - tracking, network, theme
    }

    func start() {
        // set up UI for this specific view flow



        // call an API here
        // wait a second
        // got some data

        let citiesFromAPI = ["London", "Detroit", "New York", "Philadelphia"]


        let viewController = ExamplePageViewController(cities: citiesFromAPI)
//        navigationController.present(viewController)
        // present view controller
    }
}
