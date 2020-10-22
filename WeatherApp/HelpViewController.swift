//
//  HelpQuestionForm.swift
//  WeatherApp
//
//  Created by user162990 on 1/10/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import UIKit

class HelpQuestion: NSObject {
    let question: String

    init(question: String) {
        self.question = question
    }
}

class HelpViewController: UIViewController {

    let questions: [HelpQuestion] = [
        HelpQuestion(question: "I need help!"),
        HelpQuestion(question: "I've got a business opportunity"),
        HelpQuestion(question: "I'm a Publisher"),
        HelpQuestion(question: "I'm in the media"),
        HelpQuestion(question: "I just wanted to say hi"),
        HelpQuestion(question: "I have a copyright issue"),
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
        collectionView.register(HelpCell.self, forCellWithReuseIdentifier: "helpCell")

        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        navigationItem.title = "Help Questions"

    }
}

extension HelpViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "helpCell", for: indexPath) as? HelpCell

        let question = questions[indexPath.item] // indexPath.item --> the current cell I am on in the grid
        cell?.update(question: question.question)

        return cell ?? UICollectionViewCell()
    }
}

class HelpCell: UICollectionViewCell {

    let questionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        questionLabel.textColor = UIColor.white
        questionLabel.font = UIFont.systemFont(ofSize: 20)
        
//        let stack = UIStackView(arrangedSubviews: [questionLabel, UIView()])
//        stack.axis = .vertical
//        stack.spacing = 8
//        stack.alignment = .center

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


        contentView.addSubview(questionLabel)

        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        questionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(question: String) {
        questionLabel.text = question
    }
}

