//
//  CollectionViewCell.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 16/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var characterImageView : UIImageView = {
        let myView = UIImageView()
        myView.image = nil
        myView.contentMode = .scaleAspectFill
        myView.clipsToBounds = true
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    let characterLabel : UILabel = {
        let myCharacterLabel = UILabel()
        myCharacterLabel.text = "Spider-Men"
        myCharacterLabel.font = UIFont.boldSystemFont(ofSize: 16)
        myCharacterLabel.textColor = UIColor.black
        myCharacterLabel.textAlignment = .left
        myCharacterLabel.adjustsFontSizeToFitWidth = false
        myCharacterLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        myCharacterLabel.translatesAutoresizingMaskIntoConstraints = false
        return myCharacterLabel
    }()
    
    let grayView : UIView = {
        let myGrayView = UIView()
        myGrayView.backgroundColor = UIColor.myWhiteColor
        myGrayView.translatesAutoresizingMaskIntoConstraints = false
        return myGrayView
    }()
    
    func setupLayout() {
        addSubview(characterImageView)
        characterImageView.addSubview(grayView)
        grayView.addSubview(characterLabel)
        // MyViewConstrains
        
        NSLayoutConstraint.activate([
            
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor) ,
            //
            grayView.bottomAnchor.constraint(equalTo: characterImageView.bottomAnchor),
            grayView.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor),
            grayView.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            grayView.heightAnchor.constraint(equalTo: characterImageView.heightAnchor, multiplier: 0.2),
            //
            characterLabel.centerXAnchor.constraint(equalTo: grayView.centerXAnchor),
            characterLabel.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
            characterLabel.leadingAnchor.constraint(greaterThanOrEqualTo: grayView.leadingAnchor, constant: 5),
            characterLabel.trailingAnchor.constraint(lessThanOrEqualTo: grayView.trailingAnchor, constant: 5)
            
            ])
    }
}
