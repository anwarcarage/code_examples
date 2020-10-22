//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Tim Nanney on 12/14/19.
//  Copyright © 2019 Array North. All rights reserved.
//

import UIKit

class DayOfWeek: NSObject {
    let dateOfMonth: Int
    let displayName: String //Monday, Tuesday, etc
    let currentTemp: Int
    let highTemp: Int
    let lowTemp: Int
    let windSpeed: Int

    init(dateOfMonth: Int, displayName: String, currentTemp: Int, highTemp: Int, lowTemp: Int, windSpeed: Int) {
        self.dateOfMonth = dateOfMonth
        self.displayName = displayName
        self.currentTemp = currentTemp
        self.highTemp = highTemp
        self.lowTemp = lowTemp
        self.windSpeed = windSpeed
    }
}

class DetailViewController: UIViewController {

    let daysOfTheWeek: [DayOfWeek] = [
        DayOfWeek(dateOfMonth: 1, displayName: "Monday", currentTemp: 70, highTemp: 80, lowTemp: 65, windSpeed: 10),
        DayOfWeek(dateOfMonth: 2, displayName: "Tuesday", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 3, displayName: "Wednesday", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 4, displayName: "Thursday", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 5, displayName: "Friday", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 6, displayName: "Saturday", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 7, displayName: "Sunday", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 8, displayName: "Monday", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 9, displayName: "Tues", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 10, displayName: "Wed", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 11, displayName: "Thurs", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 12, displayName: "F", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24),
        DayOfWeek(dateOfMonth: 13, displayName: "Sat", currentTemp: 60, highTemp: 71, lowTemp: 59, windSpeed: 24)
    ]

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        tableView.dataSource = self
        tableView.delegate = self

        // everyone forgets this
        tableView.register(DayCell.self, forCellReuseIdentifier: "dayOfWeekCell")

        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        navigationItem.title = "Week Forecast"

        // Do any additional setup after loading the view.
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfTheWeek.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayOfWeekCell", for: indexPath) as? DayCell

        let day = daysOfTheWeek[indexPath.row]
        cell?.update(
            date: day.dateOfMonth,
            name: day.displayName,
            currentTemp: day.currentTemp,
            high: day.highTemp,
            low: day.lowTemp,
            wind: day.windSpeed
        )

        return cell ?? UITableViewCell()
    }
}

class DayCell: UITableViewCell {

    let nameButton = UIButton()
    let currentTempLabel = UILabel()
    let highLabel = UILabel()
    let lowLabel = UILabel()
    let windLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //table view set up your stuff
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // and now i can set up mine
        nameButton.setTitleColor(UIColor.white, for: .normal)
        nameButton.backgroundColor = UIColor.green

        let stack = UIStackView(arrangedSubviews: [nameButton, currentTempLabel, highLabel, lowLabel, windLabel])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .equalCentering

        contentView.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(date: Int, name: String, currentTemp: Int, high: Int, low: Int, wind: Int) {
        nameButton.setTitle("\(name) - \(date)", for: .normal)
        currentTempLabel.text = String(currentTemp)
        highLabel.text = String(high)
        lowLabel.text = String(low)
        windLabel.text = String(wind)
    }


}




//
//class Person {
//    let house
//    let car
//    let electronics
//    let food
//}
//
//class House {
//    let frontDoor
//    let backDoor
//    let leftWindow
//}
//
//class Electronics {
//    let tvs: [TV]
//}
//
//class TV {
//    let displaySize
//    let numberOfPixels
//    let refreshRate
//}
//
//let tim = Person...
//
//tim.electronics.tvs[0].displaySize // 55 inch
//
