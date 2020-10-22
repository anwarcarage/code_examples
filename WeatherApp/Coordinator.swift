//
//  Coordinator.swift
//  WeatherApp
//
//  Created by Tim Nanney on 12/12/19.
//  Copyright © 2019 Array North. All rights reserved.
//

import UIKit

/// The app router to handle all app navigation
final class Coordinator {

    let navigationController: UINavigationController
    let rootViewController: UIViewController

    init() {
        let homeViewController = HomeViewController()
        rootViewController = homeViewController
        navigationController = UINavigationController(rootViewController: homeViewController)

        start()
    }

    func start() {

    }

}
