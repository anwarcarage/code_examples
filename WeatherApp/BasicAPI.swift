//
//  BasicAPI.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class BasicAPIViewController: UIViewController {

    let button = UIButton()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Call API", for: .normal)
        button.addTarget(self, action: #selector(callAPI), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true

        label.textColor = .blue

        let stack = UIStackView(arrangedSubviews: [button, label])
        stack.axis = .vertical
        stack.spacing = 20

        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    @objc func callAPI() {
        let weatherController = WeatherController()

        weatherController.loadCurrentWeather(city: "London", completion: { (result: ResultType<CurrentWeatherData>) in
            switch result {
            case .success(let response):
                self.handleDataFromAPI(response: response)
            case .failure(let error):
                print(error)
            }
        })
    }

    func handleDataFromAPI(response: CurrentWeatherData?) {
        guard let response = response else {
            return
        }

        label.text = String(response.main.temp) + " K"
    }
}
