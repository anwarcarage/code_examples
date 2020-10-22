//
//  TripViewController.swift
//  WeatherApp
//
//  Created by user162990 on 1/18/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class IncomingData: NSObject {
    let titleOne: String
    let textOne: String
    let textTwo: String
    let textThree: String
    let textFour: String
    let imageOne = UIImage(named: "newyorkone")!
    let imageTwo = UIImage(named: "newyorktwo")!
    let imageThree = UIImage(named: "newyorkthree")!
    
    init(titleOne: String,
         textOne: String,
         textTwo: String,
         textThree: String,
         textFour: String) {
        self.titleOne = titleOne
        self.textOne = textOne
        self.textTwo = textTwo
        self.textThree = textThree
        self.textFour = textFour
    }
}

class TripViewController: UIViewController {

    let viewData: [IncomingData] = [
        IncomingData(titleOne: "New York Trip", textOne: "16 items", textTwo: "Shared", textThree: "with 4 people", textFour: "Share"),
        IncomingData(titleOne: "California Trip", textOne: "9 items", textTwo: "Shared", textThree: "with 25 people", textFour: "Share"),
        IncomingData(titleOne: "Fall Trip", textOne: "10 items", textTwo: "Shared", textThree: "with 9 people", textFour: "Share"),
        IncomingData(titleOne: "Weekend Trip", textOne: "20 items", textTwo: "Shared", textThree: "with 40 people", textFour: "Share"),
        IncomingData(titleOne: "Summer Trip", textOne: "17 items", textTwo: "Shared", textThree: "with 19 people", textFour: "Share"),
        IncomingData(titleOne: "Baseball Trip", textOne: "12 items", textTwo: "Shared", textThree: "with 6 people", textFour: "Share"),
    ]
       
    let collectionView: UICollectionView

        init() {
    //two items row
            let width = (UIScreen.main.bounds.width - 32)

    //four items row
    //        let width = (UIScreen.main.bounds.width - (16 * 3) - 32) / 4

            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: width, height: 200)
            flowLayout.scrollDirection = .vertical
            //flowLayout.minimumInteritemSpacing = 16
            flowLayout.minimumLineSpacing = 16
            flowLayout.sectionInset = UIEdgeInsets(top:16, left: 16, bottom: 16, right: 16)

            collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .white

            collectionView.backgroundColor = .clear
            collectionView.dataSource = self
            collectionView.delegate = self

            // everyone forgets this
            collectionView.register(CellData.self, forCellWithReuseIdentifier: "cellData")

            view.addSubview(collectionView)

            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

            navigationItem.title = "My Vacations"

        }
    }

extension TripViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellData", for: indexPath) as? CellData

        let data = viewData[indexPath.row]
            cell?.update(
                titleOne: data.titleOne,
                textOne: data.textOne,
                textTwo: data.textTwo,
                textThree: data.textThree,
                textFour: data.textFour,
                imageOne: data.imageOne,
                imageTwo: data.imageTwo,
                imageThree: data.imageThree
        )

        return cell ?? UICollectionViewCell()
    }
}

class CellData: UICollectionViewCell {
    
    let cellTitle = UILabel()
    let cellTextOne = UILabel()
    let cellTextTwo = UILabel()
    let cellTextThree = UILabel()
    let cellTextFour = UILabel()
    var cellImages = [UIImage]()
    
    //side scrolling image viewer
          let imageSlideScroll: UICollectionView
    
    
    override init(frame: CGRect) {

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 200, height: 100)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 16
        //flowLayout.minimumLineSpacing = 16
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        imageSlideScroll = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
   
        super.init(frame: frame)
        
        let titlestack = UIStackView(arrangedSubviews: [cellTitle, cellTextOne])
        titlestack.axis = .vertical
        titlestack.spacing = 4
        titlestack.alignment = .leading
                
        let hstack = UIStackView(arrangedSubviews: [cellTextTwo, cellTextThree, UIView(), cellTextFour])
        hstack.axis = .horizontal
        hstack.spacing = 8
        hstack.alignment = .center
        
        let mainstack = UIStackView(arrangedSubviews: [titlestack, imageSlideScroll, hstack])
        mainstack.axis = .vertical
        mainstack.spacing = 16
        mainstack.alignment = .fill
    
        //cellTitle.numberOfLines = 3
        //cellTitle.lineBreakMode = .byWordWrapping
        //cellTextOne.textAlignment = .center
        //cellTextTwo.textAlignment = .center
        
        contentView.addSubview(mainstack)
        
        contentView.backgroundColor = .white
        
        // rounded corners
        contentView.layer.cornerRadius = 10

        // shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        
        //border
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1
                
        mainstack.translatesAutoresizingMaskIntoConstraints = false
        mainstack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainstack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        mainstack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        mainstack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
                
        imageSlideScroll.backgroundColor = .clear
        imageSlideScroll.dataSource = self
        imageSlideScroll.delegate = self
        
        // everyone forgets this
        imageSlideScroll.register(ImageData.self, forCellWithReuseIdentifier: "imageData")
        imageSlideScroll.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(titleOne: String, textOne: String, textTwo: String, textThree: String, textFour: String, imageOne: UIImage, imageTwo: UIImage, imageThree: UIImage) {
        cellTitle.text = String(titleOne)
        cellTextOne.text = String(textOne)
        cellTextTwo.text = String(textTwo)
        cellTextThree.text = String(textThree)
        cellTextFour.text = String(textFour)
        cellImages.append(imageOne)
        cellImages.append(imageTwo)
        cellImages.append(imageThree)
        
        imageSlideScroll.reloadData()
   }
}


extension CellData: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageData", for: indexPath) as? ImageData

        let image = cellImages[indexPath.item]
        cell?.update(image: image)

        return cell ?? UICollectionViewCell()
    }
}

class ImageData: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        contentView.backgroundColor = .black
        
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


