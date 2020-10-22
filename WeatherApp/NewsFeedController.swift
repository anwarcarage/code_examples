//
//  NewsFeedController.swift
//  WeatherApp
//
//  Created by user162990 on 1/16/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class NewsData: NSObject {
    let newsTitle: String
    let commentCount: Int
    let comments: String
    let timeStamp: String

    init(newsTitle: String,
        commentCount: Int,
        comments: String,
        timeStamp: String) {
        self.newsTitle = newsTitle
        self.commentCount = commentCount
        self.comments = comments
        self.timeStamp = timeStamp
    }
}

class NewsFeedController: UIViewController {

    let newsFeed: [NewsData] = [
        NewsData(newsTitle: "Cognitive Distortions of People Who Get Stuff Done [pdf]", commentCount: 43, comments: "comments", timeStamp: "138 points by bleigh0 2 hours ago"),
        NewsData(newsTitle: "Testing 1 2 3", commentCount: 43, comments: "comments", timeStamp: "138 points by bleigh0 2 hours ago"),
        NewsData(newsTitle: "Cognitive Distortions of People Who Get Stuff Done [pdf]", commentCount: 43, comments: "comments", timeStamp: "138 points by bleigh0 2 hours ago"),
        NewsData(newsTitle: "Cognitive Distortions of People Who Get Stuff Done [pdf]", commentCount: 43, comments: "comments", timeStamp: "138 points by bleigh0 2 hours ago"),
    
    ]
       
    let collectionView: UICollectionView

        init() {
    //two items row
            let width = UIScreen.main.bounds.width

    //four items row
    //        let width = (UIScreen.main.bounds.width - (16 * 3) - 32) / 4

            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: width, height: 80)
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0

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
            collectionView.register(NewsCell.self, forCellWithReuseIdentifier: "newsCell")

            view.addSubview(collectionView)

            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

            navigationItem.title = "News Flash"

        }
    }

extension NewsFeedController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsFeed.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as? NewsCell

        let news = newsFeed[indexPath.row]
            cell?.update(
                newsTitle: news.newsTitle,
                commentCount: news.commentCount,
                comment: news.comments,
                timeStamp: news.timeStamp
        )

        return cell ?? UICollectionViewCell()
    }
}

class NewsCell: UICollectionViewCell {
    
   let cellTitle = UILabel()
   let cellCommentCount = UILabel()
   let cellComment = UILabel()
   let cellTimeStamp = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titlestack = UIStackView(arrangedSubviews: [cellTitle, cellTimeStamp])
        titlestack.axis = .vertical
        titlestack.spacing = 4
        
        let commentstack = UIStackView(arrangedSubviews: [cellCommentCount, cellComment])
        commentstack.axis = .vertical
        commentstack.spacing = 4
        commentstack.translatesAutoresizingMaskIntoConstraints = false
        commentstack.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        let hstack = UIStackView(arrangedSubviews: [titlestack, commentstack])
        hstack.axis = .horizontal
        hstack.spacing = 8
        hstack.alignment = .center
    
        cellTitle.numberOfLines = 3
        cellTitle.lineBreakMode = .byWordWrapping
        cellCommentCount.textAlignment = .center
        cellComment.textAlignment = .center
        
        contentView.addSubview(hstack)
                
        hstack.translatesAutoresizingMaskIntoConstraints = false
        hstack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        hstack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        hstack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        hstack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        let lineView = UIView()
        lineView.backgroundColor = .black
        
        contentView.addSubview(lineView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(newsTitle: String, commentCount: Int, comment: String, timeStamp: String) {
        cellTitle.text = String(newsTitle)
        cellCommentCount.text = String(commentCount)
        cellComment.text = String(comment)
        cellTimeStamp.text = String(timeStamp)
   }
}
