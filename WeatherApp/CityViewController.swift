//
//  CityViewController.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/7/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class CityData: NSObject {
    let cityName: String
    let weatherType: String
    let temperature: Int

    init(cityName: String,
        weatherType: String,
        temperature: Int) {
        self.cityName = cityName
        self.weatherType = weatherType
        self.temperature = temperature
    }
}

class CityViewController: UIViewController {
    
    var weatherType1 = String()
    var temp1 = String()
    
    @objc func callAPI() {
        let weatherController = WeatherController()

        weatherController.loadCurrentWeather(city: "New York", completion: { (result: ResultType<CurrentWeatherData>) in
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
        weatherType1 = String(response.weather[0].main)
        temp1 = String(response.main.temp)
    }


    let cities: [CityData] = [
        CityData(cityName: "New York", weatherType: "Sunny", temperature: 60),
        CityData(cityName: "Bangkok", weatherType: "Rainy", temperature: 52),
        CityData(cityName: "Boston", weatherType: "Snowing", temperature: 20),
        CityData(cityName: "Detroit", weatherType: "Foggy", temperature: 42),
        CityData(cityName: "Philadelphia", weatherType: "Overcast", temperature: 61),
        CityData(cityName: "New York", weatherType: "Sunny", temperature: 71),
        CityData(cityName: "Bangkok", weatherType: "Rainy", temperature: 52),
        CityData(cityName: "Boston", weatherType: "Snowing", temperature: 20),
        CityData(cityName: "Detroit", weatherType: "Foggy", temperature: 42),
        CityData(cityName: "Philadelphia", weatherType: "Overcast", temperature: 61),
        CityData(cityName: "New York", weatherType: "Sunny", temperature: 71),
        CityData(cityName: "Bangkok", weatherType: "Rainy", temperature: 52),
        CityData(cityName: "Boston", weatherType: "Snowing", temperature: 20),
        CityData(cityName: "Detroit", weatherType: "Foggy", temperature: 42),
        CityData(cityName: "Philadelphia", weatherType: "Overcast", temperature: 61),
        CityData(cityName: "New York", weatherType: "Sunny", temperature: 71),
        CityData(cityName: "Bangkok", weatherType: "Rainy", temperature: 52),
        CityData(cityName: "Boston", weatherType: "Snowing", temperature: 20),
        CityData(cityName: "Detroit", weatherType: "Foggy", temperature: 42),
        CityData(cityName: "Philadelphia", weatherType: "Overcast", temperature: 61)
    ]

    let collectionView: UICollectionView

    init() {
//two items row
        let width = (UIScreen.main.bounds.width - 48) / 2

//four items row
//        let width = (UIScreen.main.bounds.width - (16 * 3) - 32) / 4

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: width, height: 200)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 16
        flowLayout.minimumLineSpacing = 16
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self

        // everyone forgets this
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: "cityCell")

        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        navigationItem.title = "City Forecast"

    }
}

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath) as? CityCell

        let city = cities[indexPath.item] // indexPath.item --> the current cell I am on in the grid
        cell?.update(city: city.cityName, weatherType: city.weatherType, temp: city.temperature)

        return cell ?? UICollectionViewCell()
    }
}

class CityCell: UICollectionViewCell {

    let cityLabel = UILabel()
    let weatherLabel = UILabel()
    let tempLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        cityLabel.textColor = UIColor.white
        cityLabel.font = UIFont.systemFont(ofSize: 20)
        weatherLabel.textColor = UIColor.white
        weatherLabel.font = UIFont.systemFont(ofSize: 14)
        tempLabel.textColor = UIColor.white
        tempLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)

        let stack = UIStackView(arrangedSubviews: [cityLabel, weatherLabel, tempLabel, UIView()])
        stack.axis = .vertical
        stack.spacing = 8

        // random background color
        contentView.backgroundColor = UIColor(red:   CGFloat(Int.random(in: 0...255)) / 255,
                                              green: CGFloat(Int.random(in: 0...255)) / 255,
                                              blue:  CGFloat(Int.random(in: 0...255)) / 255,
                                              alpha: 1.0)

        // rounded corners
        contentView.layer.cornerRadius = 10

        // shadow
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.5


        contentView.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(city: String, weatherType: String, temp: Int) {
        cityLabel.text = city
        weatherLabel.text = weatherType
        tempLabel.text = "\(temp)°"
    }
}

