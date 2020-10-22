//
//  ExamplePageViewController.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/28/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class ExamplePageViewController: UIViewController {

    let citiesInMyClass: [String]

    init(cities: [String]) {
        citiesInMyClass = cities
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let totalNumberOfCities = UILabel()
        totalNumberOfCities.text = String(citiesInMyClass.count) // 0

        // logic operators
        //
        // true && true - true
        // true && false - false
        // false && false - false
        // true || true - true
        // true || false - true
        // false || false - false
        //

        // if statements - are jsut used to decide whether you want one piece of code ot run or not
        if (citiesInMyClass.count < 10 && citiesInMyClass.count >= 2) || citiesInMyClass.count == 1 {
            totalNumberOfCities.text = "No Cities Are Avaiable to Show"
        }

        // if else statements - picking between two pieces of code to run, so that the optimal one runs
        if citiesInMyClass.isEmpty {
            totalNumberOfCities.text = "No Cities Are Avaiable to Show"
        } else if citiesInMyClass.count == 1 {
            // do something
        } else {
            totalNumberOfCities.text = String(citiesInMyClass.count) + " cities in my country"
        }

        // ! - not

        if !citiesInMyClass.isEmpty {

        }

        // inline - if statement
        let cityString = citiesInMyClass.count == 1 ? "city" : "cities"
        print(cityString)

        let city: String
        if citiesInMyClass.count == 1 {
            city = "city"
        } else {
            city = "cities"
        }



        // guard - checks is something is true and if so, run the code underneath, otherwise run just the code in the else and leave the function/ finish the function

        guard citiesInMyClass.count > 2 else {
            return
        }

        // GUARDS protect against this vvvvvvvvvvv

//        if citiesInMyClass.count > 2 {
//            if citiesInMyClass.count < 100 {
//
//            } else {
//                if citiesInMyClass.count < 1000 {
//
//
//                } else {
//                    if citiesInMyClass.count < 1000000 {
//
//                        if citiesInMyClass.count = 52143 {
//                            // do something
//                        }
//
//                    }
//                }
//            }
//        }


        // for loops
        for city in citiesInMyClass {
            print(city) // prints each city in the array
        }


        // map - magic!    $0 -- stands for each element in the array

        // I want every city to start with the text "City: "
        let citiesWithPrefix = citiesInMyClass.map({ "City: " + $0 })
        // citiesWithPrefix now equals - ["City: London", "City: Detroit"...]

        let numberArray = [1, 2, 3, 4, 5, 6]
        let stringArray = numberArray.map({ String($0) }) // ["1", "2", "3", "4", "5", "6"]





        // OPTIONALS

        // can have a value or not have a value
        var myOptionalVariable: String?
        // always must have a value
        var notOptionalVariable: String

        myOptionalVariable = "asdsadsdasd"
        myOptionalVariable = nil

        notOptionalVariable = "not"
//        notOptionalVariable = nil


        // call an api
        // api gives you a response.... or maybe it doesnt - it's very common for API data to come back as an optional


        let label = UILabel()



        // simplest way to check if your variable has a value
        if myOptionalVariable != nil {
            label.text = myOptionalVariable! + " cities" // the exclamation point basically says - taking a risk and 100% expecting the value to be there for that variable

            // so if the value is not there and the variable is nil - your app CRASHES
        }


        // we use two tools - IF LET AND DEFAULT VALUES

        // default values

        // if there is no value for myOptionalVariable - use the String after the ?? as the value here
        label.text = myOptionalVariable ?? "Here is a default value"



        // if let
        if let nonOptionalVariable = myOptionalVariable {
            label.text = nonOptionalVariable + " cities"
        } else {
            label.text = "There is no value"
        }



        let dogs: [String]? = ["Husky", "Poodle"]

        if let dogs = dogs {

            let countOfDogs = dogs.count
            print(countOfDogs)

        }


        // guard let
        guard let nonOptionalVariable = myOptionalVariable else {
            return
        }


    }


    func handleAPIResponse(response: Data?) {
        guard let response = response else {
            //show error message
            return
        }

        // response is no longer optional
    }
}

// Primitive Types
//
//  String
//  Int
//  Double
//  Bool
//  [Int]
//  [String: Int]


enum Suit {
    case spades
    case clubs
    case diamonds
    case hearts
}

enum Operator {
    case plus
    case minus
    case divide
    case multiply
}


func printCardSuit() {
    let op = Operator.plus

    if op == .plus {
        // run the plus logic
    }


    // SWITCHES



    let suit: Suit = Suit.hearts

    switch suit {
    case .spades: break
    case .clubs: break
    case .diamonds: break
    case .hearts: break
    }


    if suit == .spades {

    } else if suit == .clubs {

    } else if suit == .diamonds {

    } else if suit == .hearts {

    }

    let myText = "I love you"
    switch myText {
    case "":
        break
    case "I":
        break
    case "I hate you":
        break
    default:
        // do something in case myText doesn't match any of your cases
        break
    }
}

