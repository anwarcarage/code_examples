//
//  RentApartment.swift
//  WeatherApp
//
//  Created by user162990 on 2/10/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class RentApartment: UIViewController {
    
    let backButton = UIButton()
    let likeButton = UIButton()
    let mainTitle1 = UILabel()
    let mainTitle2 = UILabel()
    let subTitle1 = UILabel()
    var imageView = UIImageView()
    let euroPrice = UILabel()
    let perMonth = UILabel()
    let numPeople = UILabel()
    let numBeds = UILabel()
    let numBathrooms = UILabel()
    let ownerName = UILabel()
    let chatButton = UIButton()
    var ownerImageView = UIImageView()
    let features = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "livingRoomOne")
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        //imageView.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        
        backButton.setImage(UIImage(named: "backArrow"), for: .normal)
        backButton.backgroundColor = UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0) /* #008909 */
        backButton.layer.cornerRadius = 20
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        likeButton.setImage(UIImage(named: "likeHeart"), for: .normal)
        likeButton.backgroundColor = UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0) /* #008909 */
        likeButton.layer.cornerRadius = 20
        likeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let buttonStack = UIStackView(arrangedSubviews: [backButton, UIView(), likeButton])
        buttonStack.axis = .horizontal
        let imageContainer = UIView()
        imageContainer.addSubview(imageView)
        imageContainer.addSubview(buttonStack)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: imageContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.topAnchor.constraint(equalTo: imageContainer.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 32).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -32).isActive = true
        
        mainTitle1.text = "Rent Apartment Paris (75007)"
        mainTitle2.text = "3 bedrooms 92m"
        subTitle1.text = "Tour Eiffel, Paris, France"
        mainTitle1.font = .systemFont(ofSize: 24)
        mainTitle2.font = .systemFont(ofSize: 24)

        let titleStack = UIStackView(arrangedSubviews: [mainTitle1, mainTitle2, subTitle1])
        titleStack.axis = .vertical
        titleStack.spacing = 4
        let titleContainer = UIView()
        titleContainer.addSubview(titleStack)
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        titleStack.topAnchor.constraint(equalTo: titleContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        titleStack.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 32).isActive = true
        titleStack.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor).isActive = true
        titleStack.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor).isActive = true

        euroPrice.text = "$6,320"
        euroPrice.textColor = UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0) /* #008909 */
        euroPrice.font = .systemFont(ofSize: 24)
        perMonth.text = "/month"
        let priceStack = UIStackView(arrangedSubviews: [euroPrice, perMonth, UIView()])
        priceStack.axis = .horizontal
        let priceContainer = UIView()
        priceContainer.addSubview(priceStack)
        priceStack.translatesAutoresizingMaskIntoConstraints = false
        priceStack.topAnchor.constraint(equalTo: priceContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        priceStack.leadingAnchor.constraint(equalTo: priceContainer.leadingAnchor, constant: 32).isActive = true
        priceStack.bottomAnchor.constraint(equalTo: priceContainer.bottomAnchor).isActive = true
        priceStack.trailingAnchor.constraint(equalTo: priceContainer.trailingAnchor).isActive = true
        
        numPeople.text = "5 people"
        numBeds.text = "4 beds"
        numBathrooms.text = "2 bathrooms"
        let rentalInfoStack = UIStackView(arrangedSubviews: [numPeople, numBeds, numBathrooms, UIView()])
        rentalInfoStack.axis = .horizontal
        rentalInfoStack.spacing = 32
        let rentalContainer = UIView()
        rentalContainer.addSubview(rentalInfoStack)
        rentalInfoStack.translatesAutoresizingMaskIntoConstraints = false
        rentalInfoStack.topAnchor.constraint(equalTo: rentalContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        rentalInfoStack.leadingAnchor.constraint(equalTo: rentalContainer.leadingAnchor, constant: 32).isActive = true
        rentalInfoStack.bottomAnchor.constraint(equalTo: rentalContainer.bottomAnchor).isActive = true
        rentalInfoStack.trailingAnchor.constraint(equalTo: rentalContainer.trailingAnchor).isActive = true
        
        let divider1 = UIView()
        let divider1Container = UIView()
        divider1Container.addSubview(divider1)
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider1.backgroundColor = .lightGray
        divider1.leadingAnchor.constraint(equalTo: divider1Container.leadingAnchor, constant: 32).isActive = true
        divider1.trailingAnchor.constraint(equalTo: divider1Container.trailingAnchor, constant: -32).isActive = true
        
        let divider2 = UIView()
        let divider2Container = UIView()
        divider2Container.addSubview(divider2)
        divider2.translatesAutoresizingMaskIntoConstraints = false
        divider2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider2.backgroundColor = .lightGray
        divider2.leadingAnchor.constraint(equalTo: divider2Container.leadingAnchor, constant: 32).isActive = true
        divider2.trailingAnchor.constraint(equalTo: divider2Container.trailingAnchor, constant: -32).isActive = true
        
        ownerName.text = "Tim Nanney"
        ownerImageView.translatesAutoresizingMaskIntoConstraints = false
        ownerImageView.image = UIImage(named: "avatar")
        ownerImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ownerImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        chatButton.setTitle("Chat Now", for: .normal)
        chatButton.backgroundColor = UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0) /* #008909 */
        chatButton.setTitleColor(.white, for: .normal)
        chatButton.layer.cornerRadius = 5
        chatButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        let chatStack = UIStackView(arrangedSubviews: [ownerImageView, ownerName, UIView(), chatButton])
        chatStack.axis = .horizontal
        chatStack.spacing = 16
        let chatContainer = UIView()
        chatContainer.addSubview(chatStack)
        chatStack.translatesAutoresizingMaskIntoConstraints = false
        chatStack.topAnchor.constraint(equalTo: chatContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        chatStack.leadingAnchor.constraint(equalTo: chatContainer.leadingAnchor, constant: 32).isActive = true
        chatStack.bottomAnchor.constraint(equalTo: chatContainer.bottomAnchor).isActive = true
        chatStack.trailingAnchor.constraint(equalTo: chatContainer.trailingAnchor, constant: -32).isActive = true
        
        func makeLabel(title: String, color: UIColor, icon: UIImage) -> UIStackView {
            let label = UILabel()
            let labelImageView = UIImageView()
            label.text = title
            label.textColor = color
            label.font = .systemFont(ofSize: 12)
            labelImageView.image = icon
            labelImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            labelImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            
            let labelStack = UIStackView(arrangedSubviews: [labelImageView, label])
            labelStack.axis = .horizontal
            labelStack.spacing = 8
            
            return labelStack
        }
        
        let wifiFeature = makeLabel(title: "WiFi", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let tvFeature = makeLabel(title: "TV", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let ovenFeature = makeLabel(title: "Oven", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let featureStackHorz1 = UIStackView(arrangedSubviews: [wifiFeature, tvFeature, ovenFeature])
        featureStackHorz1.axis = .horizontal
        featureStackHorz1.spacing = 8
        featureStackHorz1.distribution = .fillEqually
        
        let dryerFeature = makeLabel(title: "Dryer", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let showerFeature = makeLabel(title: "Shower", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let dishwasherFeature = makeLabel(title: "Dishwasher", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let featureStackHorz2 = UIStackView(arrangedSubviews: [dryerFeature, showerFeature, dishwasherFeature])
        featureStackHorz2.axis = .horizontal
        featureStackHorz2.spacing = 8
        featureStackHorz2.distribution = .fillEqually
        
        let toasterFeature = makeLabel(title: "Toaster", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let phoneFeature = makeLabel(title: "Phone", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let microwaveFeature = makeLabel(title: "Microwave", color: UIColor(red: 0, green: 0.5373, blue: 0.0353, alpha: 1.0), icon: UIImage(named: "wifiIcon")!)
        let featureStackHorz3 = UIStackView(arrangedSubviews: [toasterFeature, phoneFeature, microwaveFeature])
        featureStackHorz3.axis = .horizontal
        featureStackHorz3.spacing = 8
        featureStackHorz3.distribution = .fillEqually
        
        features.text = "Features"
        let featureStackVert = UIStackView(arrangedSubviews: [features, featureStackHorz1, featureStackHorz2, featureStackHorz3])
        featureStackVert.axis = .vertical
        featureStackVert.spacing = 12
        let featureContainer = UIView()
        featureContainer.addSubview(featureStackVert)
        featureStackVert.translatesAutoresizingMaskIntoConstraints = false
        featureStackVert.topAnchor.constraint(equalTo: featureContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        featureStackVert.leadingAnchor.constraint(equalTo: featureContainer.leadingAnchor, constant: 32).isActive = true
        featureStackVert.bottomAnchor.constraint(equalTo: featureContainer.bottomAnchor).isActive = true
        featureStackVert.trailingAnchor.constraint(equalTo: featureContainer.trailingAnchor, constant: -32).isActive = true
        
        let mainStack = UIStackView(arrangedSubviews: [imageContainer, titleContainer, priceContainer, rentalContainer, divider1Container, chatContainer, divider2Container, featureContainer, UIView()])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        
        mainStack.setCustomSpacing(32, after: rentalContainer)
        mainStack.setCustomSpacing(32, after: divider1Container)
        mainStack.setCustomSpacing(32, after: chatContainer)
        mainStack.setCustomSpacing(32, after: divider2Container)
        
        view.addSubview(mainStack)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
