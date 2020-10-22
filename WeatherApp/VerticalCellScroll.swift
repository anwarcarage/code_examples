//
//  VerticalCellScroll.swift
//  WeatherApp
//
//  Created by user162990 on 2/18/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class VerticalCellScroll: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let collectionView: UICollectionView
    
    
    init() {
        
        let width = (UIScreen.main.bounds.width - 32)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: width, height: 360)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16
        flowLayout.sectionInset = UIEdgeInsets(top:16, left: 16, bottom: 16, right: 16)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        super.init(frame: .zero)
        
        self.backgroundColor = .groupTableViewBackground
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // everyone forgets this
        collectionView.register(ProfileCard.self, forCellWithReuseIdentifier: "profileCard")
        //collectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        self.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCard", for: indexPath) as? ProfileCard
        
        return card ?? UICollectionViewCell()
    }
}

class ProfileCard: UICollectionViewCell {
    let mainImage = UIImageView()
    let avatarImage = UIImageView()
    let userName = UILabel()
    let menuButton = UIButton()
    let likeButton = UIButton()
    let commentButton = UIButton()
    let bookmarkButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        mainImage.contentMode = .scaleAspectFill
        mainImage.layer.cornerRadius = 16
        mainImage.clipsToBounds = true
        mainImage.image = UIImage(named: "newyorkthree")
        
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.layer.cornerRadius = 16
        avatarImage.clipsToBounds = true
        avatarImage.image = UIImage(named: "bwAvatar")
        avatarImage.widthAnchor.constraint(equalToConstant: 32).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        userName.text = "Tim Nanney"
        
        menuButton.setImage(UIImage(named: "homeIcon"), for: .normal)
        menuButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        likeButton.setImage(UIImage(named: "likeHeart"), for: .normal)
        likeButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        commentButton.setImage(UIImage(named: "commentIcon"), for: .normal)
        commentButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        bookmarkButton.setImage(UIImage(named: "bookmarkIcon"), for: .normal)
        bookmarkButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        bookmarkButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        let cellTitleStack = UIStackView(arrangedSubviews: [avatarImage, userName, UIView(), menuButton])
        cellTitleStack.axis = .horizontal
        cellTitleStack.spacing = 16
        let titleContainer = UIView()
        titleContainer.addSubview(cellTitleStack)
        cellTitleStack.translatesAutoresizingMaskIntoConstraints = false
        cellTitleStack.topAnchor.constraint(equalTo: titleContainer.topAnchor).isActive = true
        cellTitleStack.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 16).isActive = true
        cellTitleStack.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor).isActive = true
        cellTitleStack.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor, constant: -16).isActive = true

        let footerStack = UIStackView(arrangedSubviews: [likeButton, commentButton, UIView(), bookmarkButton])
        footerStack.axis = .horizontal
        footerStack.spacing = 16
        let footerContainer = UIView()
        footerContainer.addSubview(footerStack)
        footerStack.translatesAutoresizingMaskIntoConstraints = false
        footerStack.topAnchor.constraint(equalTo: footerContainer.topAnchor).isActive = true
        footerStack.leadingAnchor.constraint(equalTo: footerContainer.leadingAnchor, constant: 16).isActive = true
        footerStack.bottomAnchor.constraint(equalTo: footerContainer.bottomAnchor).isActive = true
        footerStack.trailingAnchor.constraint(equalTo: footerContainer.trailingAnchor, constant: -16).isActive = true
        
        let mainStack = UIStackView(arrangedSubviews: [cellTitleStack, mainImage, footerStack])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        
        self.addSubview(mainStack)
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
