//
//  InstagramDesign.swift
//  WeatherApp
//
//  Created by user162990 on 2/17/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class InstagramDesign: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let incomingAvatar: [UIImage] = [UIImage(named: "avatar")!, UIImage(named: "avatar")!, UIImage(named: "avatar")!, UIImage(named: "avatar")!, UIImage(named: "avatar")!, UIImage(named: "avatar")!, UIImage(named: "avatar")!, UIImage(named: "avatar")!, UIImage(named: "avatar")!, UIImage(named: "avatar")!]
    let locationButton = UIButton()
    let cameraButton = UIButton()
    let titleLabel = UILabel()
    
    let avatarSideScroll: UICollectionView
    let verticalCellScroll = VerticalCellScroll()
    let footerBar = FooterBar()
    
    init() {

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 68, height: 68)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 16
        flowLayout.sectionInset = UIEdgeInsets(top:16, left: 16, bottom: 16, right: 16)
    
        avatarSideScroll = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    //Header bar buttons and label
        cameraButton.setImage(UIImage(named: "cameraIcon"), for: .normal)
        cameraButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        cameraButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        locationButton.setImage(UIImage(named: "gpsIcon"), for: .normal)
        locationButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        titleLabel.text = "LifeReel"
        titleLabel.font = UIFont(name: "Chalkduster", size: 24)
        let titleStack = UIStackView(arrangedSubviews: [cameraButton, titleLabel, locationButton])
        titleStack.axis = .horizontal
        titleStack.distribution = .equalSpacing
        let titleContainer = UIView()
        titleContainer.addSubview(titleStack)
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        titleStack.topAnchor.constraint(equalTo: titleContainer.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        titleStack.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 16).isActive = true
        titleStack.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor).isActive = true
        titleStack.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor, constant: -16).isActive = true
        
        avatarSideScroll.backgroundColor = .clear
        avatarSideScroll.dataSource = self
        avatarSideScroll.delegate = self

        // everyone forgets this
        avatarSideScroll.register(AvatarData.self, forCellWithReuseIdentifier: "avatarData")
        avatarSideScroll.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let mainStack = UIStackView(arrangedSubviews: [titleContainer, avatarSideScroll, verticalCellScroll, footerBar])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        
        view.addSubview(mainStack)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    //Side scrolling avatar buttons
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return incomingAvatar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let avatar = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarData", for: indexPath) as? AvatarData
        
        let image = incomingAvatar[indexPath.item]
        avatar?.update(image: image)
        
        return avatar ?? UICollectionViewCell()
    }
    
}

class AvatarData: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 34
        imageView.clipsToBounds = true
               
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(image:UIImage){
        imageView.image = image
    }
}
