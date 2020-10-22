//
//  Coordinator.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/28/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

class AppCoordinator {

    init() {
        // set up stuff for app
    }

    func start() {
        // set up initial UI - usually set up a nav bar or tab bar and then load first screen
    }

    func goToExamplePage() {
        let exampleRouter = ExampleRouter()
        exampleRouter.start()
    }

}
