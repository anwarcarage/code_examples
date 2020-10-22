//
//  AddressForm.swift
//  WeatherApp
//
//  Created by user162990 on 1/10/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class AddressFormController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstNameTextField: UITextField = UITextField()
        let lastNameTextField: UITextField = UITextField()
        let addressTextField: UITextField = UITextField()
        let apartmentTextField: UITextField = UITextField()
        let cityTextField: UITextField = UITextField()
        let stateTextField: UITextField = UITextField()
        let countryTextField: UITextField = UITextField()
        let zipTextField: UITextField = UITextField()
        let submitBtn: UIButton = UIButton()
        
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.backgroundColor = UIColor.white
        firstNameTextField.textColor = UIColor.black
        firstNameTextField.placeholder = "First Name"
        firstNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        firstNameTextField.font = .systemFont(ofSize: 24)
        firstNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 44))
        firstNameTextField.leftViewMode = .always
        firstNameTextField.layer.cornerRadius = 5
        firstNameTextField.layer.borderWidth = 1
        firstNameTextField.layer.borderColor = UIColor.gray.cgColor
                
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.backgroundColor = UIColor.white
        lastNameTextField.textColor = UIColor.black
        lastNameTextField.placeholder = "Last Name"
        lastNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        lastNameTextField.font = .systemFont(ofSize: 24)
        lastNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 44))
        lastNameTextField.leftViewMode = .always
        lastNameTextField.layer.cornerRadius = 5
        lastNameTextField.layer.borderWidth = 1
        lastNameTextField.layer.borderColor = UIColor.gray.cgColor
        
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.backgroundColor = UIColor.white
        addressTextField.textColor = UIColor.black
        addressTextField.placeholder = "Address"
        addressTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        addressTextField.font = .systemFont(ofSize: 24)
        addressTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 44))
        addressTextField.leftViewMode = .always
        addressTextField.layer.cornerRadius = 5
        addressTextField.layer.borderWidth = 1
        addressTextField.layer.borderColor = UIColor.gray.cgColor
        
        apartmentTextField.translatesAutoresizingMaskIntoConstraints = false
        apartmentTextField.backgroundColor = UIColor.white
        apartmentTextField.textColor = UIColor.black
        apartmentTextField.placeholder = "Appartment, suite, ect."
        apartmentTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        apartmentTextField.font = .systemFont(ofSize: 24)
        apartmentTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 44))
        apartmentTextField.leftViewMode = .always
        apartmentTextField.layer.cornerRadius = 5
        apartmentTextField.layer.borderWidth = 1
        apartmentTextField.layer.borderColor = UIColor.gray.cgColor
        
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.backgroundColor = UIColor.white
        cityTextField.textColor = UIColor.black
        cityTextField.placeholder = "City"
        cityTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        cityTextField.font = .systemFont(ofSize: 24)
        cityTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 44))
        cityTextField.leftViewMode = .always
        cityTextField.layer.cornerRadius = 5
        cityTextField.layer.borderWidth = 1
        cityTextField.layer.borderColor = UIColor.gray.cgColor
        
        stateTextField.translatesAutoresizingMaskIntoConstraints = false
        stateTextField.backgroundColor = UIColor.white
        stateTextField.textColor = UIColor.black
        stateTextField.placeholder = "State/province"
        stateTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        stateTextField.font = .systemFont(ofSize: 24)
        stateTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 44))
        stateTextField.leftViewMode = .always
        stateTextField.layer.cornerRadius = 5
        stateTextField.layer.borderWidth = 1
        stateTextField.layer.borderColor = UIColor.gray.cgColor
        
        countryTextField.translatesAutoresizingMaskIntoConstraints = false
        countryTextField.backgroundColor = UIColor.white
        countryTextField.textColor = UIColor.black
        countryTextField.placeholder = "Country"
        countryTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        countryTextField.font = .systemFont(ofSize: 24)
        countryTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 44))
        countryTextField.leftViewMode = .always
        countryTextField.layer.cornerRadius = 5
        countryTextField.layer.borderWidth = 1
        countryTextField.layer.borderColor = UIColor.gray.cgColor
        
        zipTextField.translatesAutoresizingMaskIntoConstraints = false
        zipTextField.backgroundColor = UIColor.white
        zipTextField.textColor = UIColor.black
        zipTextField.placeholder = "Zip/postal code"
        zipTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        zipTextField.font = .systemFont(ofSize: 24)
        zipTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 44))
        zipTextField.leftViewMode = .always
        zipTextField.layer.cornerRadius = 5
        zipTextField.layer.borderWidth = 1
        zipTextField.layer.borderColor = UIColor.gray.cgColor
        
        submitBtn.widthAnchor.constraint(equalToConstant: 125).isActive = true
        submitBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        submitBtn.backgroundColor = .blue
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.layer.cornerRadius = 5

        let hstack = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField])
        hstack.axis = .horizontal
        hstack.spacing = 10
        hstack.distribution = .fillEqually
        
        let bstack = UIStackView(arrangedSubviews:[UIView(), submitBtn])
        bstack.axis = .horizontal
        bstack.spacing = 10
        
        let stack = UIStackView(arrangedSubviews: [hstack, addressTextField, addressTextField, apartmentTextField, cityTextField, stateTextField, countryTextField, zipTextField, bstack, UIView()])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)

        view.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
    }
}
