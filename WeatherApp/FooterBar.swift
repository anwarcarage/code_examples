//
//  FooterBar.swift
//  WeatherApp
//
//  Created by user162990 on 2/19/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class FooterBar: UIView {

    let homeButton = UIButton()
    let searchButton = UIButton()
    let addButton = UIButton()
    let likeButton = UIButton()
    let profileButton = UIButton()

    init() {
        
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        homeButton.setImage(UIImage(named: "homeIcon"), for: .normal)
        homeButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        searchButton.setImage(UIImage(named: "searchIcon"), for: .normal)
        searchButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        addButton.setImage(UIImage(named: "addIcon"), for: .normal)
        addButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        likeButton.setImage(UIImage(named: "likeHeart"), for: .normal)
        likeButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        profileButton.setImage(UIImage(named: "bwAvatar"), for: .normal)
        profileButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        let footerStack = UIStackView(arrangedSubviews: [homeButton, searchButton, addButton, likeButton, profileButton])
        footerStack.axis = .horizontal
        footerStack.distribution = .equalSpacing
        let footerContainer = UIView()
        footerContainer.addSubview(footerStack)
        footerStack.translatesAutoresizingMaskIntoConstraints = false
        footerStack.centerYAnchor.constraint(equalTo: footerContainer.centerYAnchor).isActive = true
        footerStack.leadingAnchor.constraint(equalTo: footerContainer.leadingAnchor, constant: 24).isActive = true
        footerStack.trailingAnchor.constraint(equalTo: footerContainer.trailingAnchor, constant: -24).isActive = true
        
        self.addSubview(footerContainer)
        
        footerContainer.translatesAutoresizingMaskIntoConstraints = false
        footerContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        footerContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        footerContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        footerContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        footerContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
