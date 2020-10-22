//
//  Calculator.swift
//  WeatherApp
//
//  Created by user162990 on 1/21/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class Calculator: UIViewController {
    
    var firstNumber: Double = 0
    var operation = "";
    var nextOperation = "";
    var secondNumber: Double = 0;
    var btnTapped: Bool = false;
    let input = UILabel()
    let inputContainer = UIView()
    var btnInput = ""
    var btnStringOne = [String]()
    var btnStringTwo = [String]()

    
    func makeButton(title: String, color: UIColor, id: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.tag = id
        
        return button
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        btnTapped = true
        btnInput = String(sender.tag)
        
        if btnTapped == true && sender.tag >= 0 && sender.tag <= 9 && operation == "" {
            btnStringOne.append(btnInput)
            btnTapped = false
            controlMath()
        } else if btnTapped == true && operation == "" && btnInput == "11" {
            if btnStringOne.contains(".") {
                    btnTapped = false
                } else {
                    btnStringOne.append(".")
                    btnTapped = false
                    controlMath()
                }
        } else if btnTapped == true && btnInput == "12" {
            //for each btnInput 0 thru 9
            clearMath()
            btnTapped = false
        } else if btnTapped == true && btnInput == "15" {
             if operation != "" {
                nextOperation = "+"
            } else if operation == "" {
                operation = "+"
            }
            btnTapped = false
            handleOperation()
        } else if btnTapped == true && btnInput == "16" {
            if operation != "" {
                nextOperation = "-"
            } else if operation == "" {
                operation = "-"
            }
            btnTapped = false
            handleOperation()
        } else if btnTapped == true && btnInput == "17" {
            if operation != "" {
                nextOperation = "/"
            } else if operation == "" {
                operation = "/"
            }
            btnTapped = false
            handleOperation()
        } else if btnTapped == true && btnInput == "18" {
            if operation != "" {
                nextOperation = "*"
            } else if operation == "" {
                operation = "*"
            }
            btnTapped = false
            handleOperation()
        } else if btnTapped == true && sender.tag >= 0 && sender.tag <= 9 && operation != "" {
            btnStringTwo.append(btnInput)
            btnTapped = false
            controlMath()
        } else if btnTapped == true && operation != "" && btnInput == "11" {
            if btnStringTwo.contains(".") {
                    btnTapped = false
                } else {
                    btnStringTwo.append(".")
                    btnTapped = false
                    controlMath()
                }
        } else if btnTapped == true && btnInput == "19" {
            if operation == "" {
                btnTapped = false
            } else {
                doMath()
            }
        }
    }
        
    func controlMath() {
        if !btnStringOne.isEmpty && operation == "" {
            input.text = btnStringOne.joined()
        } else if !btnStringTwo.isEmpty && operation != "" {
            input.text = btnStringTwo.joined()
        }
    }
    
    func doMath() {
        let x = Double(btnStringOne.joined())!
        let y = Double(btnStringTwo.joined())!
        
        if operation == "+" {
            input.text = String(x + y)
        } else if operation == "-" {
            input.text = String(x - y)
        } else if operation == "/" {
            input.text = String(x/y)
        } else if operation == "*" {
            input.text = String(x*y)
        }
    }
    
    func handleOperation() {
        if !btnStringOne.isEmpty && !btnStringTwo.isEmpty && operation != "" {
            controlMath()
            doMath()
            operation = nextOperation
            btnStringOne = input.text?.map { String($0) } ?? []
            btnStringTwo = []
        }
    }
    
    func clearMath() {
        btnStringOne = []
        btnStringTwo = []
        operation = ""
        input.text = ""
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnOne = makeButton(title: "1", color: .gray, id: 1)
        let btnTwo = makeButton(title: "2", color: .gray, id: 2)
        let btnThree = makeButton(title: "3", color: .gray, id: 3)
        let btnFour = makeButton(title: "4", color: .gray, id: 4)
        let btnFive = makeButton(title: "5", color: .gray, id: 5)
        let btnSix = makeButton(title: "6", color: .gray, id: 6)
        let btnSeven = makeButton(title: "7", color: .gray, id: 7)
        let btnEight = makeButton(title: "8", color: .gray, id: 8)
        let btnNine = makeButton(title: "9", color: .gray, id: 9)
        let btnZero = makeButton(title: "0", color: .gray, id: 0)
        let btnPoint = makeButton(title: ".", color: .gray, id: 11)
        let btnClear = makeButton(title: "AC", color: .orange, id: 12)
        let btnPosNeg = makeButton(title: "+/-", color: .orange, id: 13)
        let btnPercentage = makeButton(title: "%", color: .orange, id: 14)
        let btnAdd = makeButton(title: "+", color: .orange, id: 15)
        let btnSubtract = makeButton(title: "-", color: .orange, id: 16)
        let btnDivide = makeButton(title: "/", color: .orange, id: 17)
        let btnMultiply = makeButton(title: "x", color: .orange, id: 18)
        let btnEquals = makeButton(title: "=", color: .orange, id: 19)
        
            
        inputContainer.addSubview(input)
        input.translatesAutoresizingMaskIntoConstraints = false
        input.topAnchor.constraint(equalTo: inputContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        input.leadingAnchor.constraint(equalTo: inputContainer.leadingAnchor).isActive = true
        input.bottomAnchor.constraint(equalTo: inputContainer.bottomAnchor).isActive = true
        input.trailingAnchor.constraint(equalTo: inputContainer.trailingAnchor, constant: -8).isActive = true
        
        let hstack1 = UIStackView(arrangedSubviews: [btnClear, btnPosNeg, btnPercentage, btnDivide])
        hstack1.axis = .horizontal
        hstack1.spacing = 8
        
        let hstack2 = UIStackView(arrangedSubviews: [btnSeven, btnEight, btnNine, btnMultiply])
        hstack2.axis = .horizontal
        hstack2.spacing = 8
        
        let hstack3 = UIStackView(arrangedSubviews: [btnFour, btnFive, btnSix, btnSubtract])
        hstack3.axis = .horizontal
        hstack3.spacing = 8
        
        let hstack4 = UIStackView(arrangedSubviews: [btnOne, btnTwo, btnThree, btnAdd])
        hstack4.axis = .horizontal
        hstack4.spacing = 8
        
        let hstack5 = UIStackView(arrangedSubviews: [btnZero, btnPoint, btnEquals])
        hstack5.axis = .horizontal
        hstack5.spacing = 8
        
        let mainstack = UIStackView(arrangedSubviews: [inputContainer, hstack1, hstack2, hstack3, hstack4, hstack5, UIView()])
        mainstack.axis = .vertical
        mainstack.spacing = 8
        
        view.addSubview(mainstack)
        
        mainstack.translatesAutoresizingMaskIntoConstraints = false
        mainstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainstack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainstack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainstack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainstack.distribution = .fillEqually
        
        input.textAlignment = .right
        inputContainer.backgroundColor = .white
        
    }

}
