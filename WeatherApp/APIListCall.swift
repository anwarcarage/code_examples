//
//  APIListCall.swift
//  WeatherApp
//
//  Created by user162990 on 2/7/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class APIListCall: UIViewController {
    
    let button = UIButton()
    var menuItems = [DailyWeatherData]()
    
    @objc func callAPI() {
        let weatherController = WeatherController()

        weatherController.loadForecast(city: "New York", completion: { (result: ResultType<ForecastData>) in
            switch result {
            case .success(let response):
                self.handleDataFromAPI(response: response)
            case .failure(let error):
                print(error)
            }
        })
    }

    func handleDataFromAPI(response: ForecastData?) {
        guard let response = response else {
            return
        }

        menuItems.append(response.list[0])
        tableView.reloadData()
        
    }
    
    let tableView = UITableView()
   
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

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")

        //label.textColor = .blue

        let stack = UIStackView(arrangedSubviews: [button, tableView])
        stack.axis = .vertical
        stack.spacing = 20

        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension APIListCall: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        
        cell.textLabel?.text = String(menuItems[indexPath.row].main.temp_max) + " " +
                            String(menuItems[indexPath.row].main.temp_min)
        
        return cell
    }
    
    /// This is used whenever you want to take an action on a user selecting a specific cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row] // Detail Screen
    }
}
