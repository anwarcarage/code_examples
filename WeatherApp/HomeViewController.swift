//
//  ViewController.swift
//  WeatherApp
//
//  Created by Tim Nanney on 11/7/19.
//  Copyright © 2019 Array North. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let tableView = UITableView()

    let menuItems = ["Week View", "City View", "Help View", "Address Form", "News Feed", "Trip View", "Calculator", "Basic API", "APIListCall", "RentApartment", "InstagramDesign"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.backgroundColor = .white

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")

        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        navigationItem.title = "Main Menu"
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)

        cell.textLabel?.text = menuItems[indexPath.row]

        return cell
    }

    /// This is used whenever you want to take an action on a user selecting a specific cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row] // Detail Screen

        if menuItem == "Basic API" {
            navigationController?.pushViewController(BasicAPIViewController(), animated: true)
        }

        if menuItem == "Week View" {
            // push to the new screen

            // Pushes a view onto the navigation stack
            navigationController?.pushViewController(DetailViewController(), animated: true)

            // Presents a view onto the navigation stack
//            navigationController?.present(DetailViewController(), animated: true)
        }

        if menuItem == "City View" {
            navigationController?.pushViewController(CityViewController(), animated: true)
        }
        if menuItem == "Help View" {
            navigationController?.pushViewController(HelpViewController(), animated: true)
        }
        if menuItem == "Address Form" {
            navigationController?.pushViewController(AddressFormController(), animated: true)
        }
        if menuItem == "News Feed" {
            navigationController?.pushViewController(NewsFeedController(), animated: true)
        }
        if menuItem == "Trip View" {
            navigationController?.pushViewController(TripViewController(), animated: true)
        }
        if menuItem == "Calculator" {
            navigationController?.pushViewController(Calculator(), animated: true)
        }
        if menuItem == "APIListCall" {
            navigationController?.pushViewController(APIListCall(), animated: true)
        }
        if menuItem == "RentApartment" {
            navigationController?.pushViewController(RentApartment(), animated: true)
        }
        if menuItem == "InstagramDesign" {
            navigationController?.pushViewController(InstagramDesign(), animated: true)
        }

    }
}
