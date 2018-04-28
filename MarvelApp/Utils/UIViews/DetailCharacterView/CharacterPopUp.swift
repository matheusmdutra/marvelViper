////
////  CharacterPopUp.swift
////  MarvelApp
////
////  Created by Matheus Dutra on 21/04/2018.
////  Copyright © 2018 Matheus Dutra. All rights reserved.
////
//
//import Foundation
//import UIKit
//import Nuke
//
//class CharacterPopUp {
//    
//    var popUpView : UIView = {
//        var mPopUpView = UIView()
//        mPopUpView.translatesAutoresizingMaskIntoConstraints = false
//        mPopUpView.layer.borderColor = UIColor.blue.cgColor
//        mPopUpView.layer.cornerRadius = 15
//        mPopUpView.backgroundColor = UIColor.myRedColor
//        return mPopUpView
//    }()
//    var TopImageView : UIImageView = {
//        var myTopImageView = UIImageView()
//        myTopImageView.backgroundColor = UIColor.gray
//        myTopImageView.contentMode = .scaleAspectFill
//        myTopImageView.clipsToBounds = true
//        myTopImageView.layer.borderWidth = 0.5
//        myTopImageView.layer.borderColor = UIColor.black.cgColor
//        myTopImageView.layer.cornerRadius = 15
//        myTopImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        
//        myTopImageView.translatesAutoresizingMaskIntoConstraints = false
//        return myTopImageView
//    }()
//    
//    var MiddleView : UIView = {
//        var myMiddleView = UIView()
//        myMiddleView.backgroundColor = UIColor.darkGray
//        myMiddleView.layer.borderWidth = 0.5
//       
//        myMiddleView.layer.borderColor = UIColor.black.cgColor
//        myMiddleView.layer.borderColor = UIColor.black.cgColor
//        myMiddleView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return myMiddleView
//    }()
//    
//    var MiddleTextView : UITextView = {
//        var myMiddleTextView = UITextView()
//        myMiddleTextView.backgroundColor = UIColor.clear
//        myMiddleTextView.layer.borderWidth = 1
//        myMiddleTextView.layer.cornerRadius = 10
//        myMiddleTextView.layer.borderColor = UIColor.black.cgColor
//        myMiddleTextView.translatesAutoresizingMaskIntoConstraints = false
//        myMiddleTextView.textAlignment = .center
//        myMiddleTextView.isEditable = false
//        myMiddleTextView.isScrollEnabled = false
//     
//        return myMiddleTextView
//    }()
//    
//    var characterNameLabel : UILabel = {
//        var myCharacterNameLabel = UILabel()
//        myCharacterNameLabel.font = UIFont.boldSystemFont(ofSize: 19)
//             myCharacterNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        return myCharacterNameLabel
//    }()
//
//    var BottomView : UIView = {
//        var myBottomView = UIImageView()
//        myBottomView.backgroundColor = UIColor.darkGray
//        myBottomView.layer.borderWidth = 0.5
//        myBottomView.layer.cornerRadius = 15
//        myBottomView.layer.borderColor = UIColor.black.cgColor
//        myBottomView.layer.cornerRadius = 15
//        myBottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        myBottomView.translatesAutoresizingMaskIntoConstraints = false
//        return myBottomView
//    }()
//    
//    var separeteView : UIView = {
//        var mySepareteView = UIView()
//        mySepareteView.backgroundColor = UIColor.black
//        mySepareteView.translatesAutoresizingMaskIntoConstraints = false
//        return mySepareteView
//    }()
//    
//    var backButton : UIButton = {
//        var myBackButton = UIButton(type: .system)
//        myBackButton.setTitle("Back", for: .normal)
//        myBackButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//        myBackButton.tintColor = UIColor.black
//        myBackButton.backgroundColor = UIColor.clear
//        myBackButton.translatesAutoresizingMaskIntoConstraints = false
//  
////        myBackButton.addTarget(, action: #selector(dismissEverything), for: .touchUpInside)
//        return myBackButton
//    }()
//    @objc func dismissEverything() {
//        popUpView.removeFromSuperview()
//    }
////    @objc func nextAction() {
//////        var nextPage = min (pageControl.currentPage + 1, content.count - 1)
//////        pageControl.currentPage = nextPage
//////        var nextIndex = IndexPath(item: nextPage, section: 0)
//////        collectionView?.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: true)
////    }
//    
//    var siteButton : UIButton = {
//        var mySiteButton = UIButton(type: .system)
//        mySiteButton.setTitle("Marvel Page", for: .normal)
//       
//        mySiteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//        mySiteButton.tintColor = UIColor.black
//        mySiteButton.backgroundColor = UIColor.clear
//        mySiteButton.translatesAutoresizingMaskIntoConstraints = false
//        //        myNextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
//        return mySiteButton
//    }()
//    
//    func retrivingAttributedText(description: String) -> NSAttributedString {
//        let attributedText = NSMutableAttributedString(string: "  \(description)", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white , NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17), ])
//     
//        
////
////         let attributedText = NSMutableAttributedString(string: "Character: \(characterName)\n\n" , attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor : UIColor.white ])
//        return attributedText
//    }
//    
//    func presentCharacterInfo(view: UIView , forRow: Int) {
//        
//        var myStackView = UIStackView(arrangedSubviews: [backButton, siteButton])
//        myStackView.distribution = .fillProportionally
//        myStackView.spacing = 80
//   
//       
//        myStackView.translatesAutoresizingMaskIntoConstraints = false
//       
//       var currentCharacter = AllCharacteres.sharedInstance.allCharacteres[forRow]
//     
//           Nuke.Manager.shared.loadImage(with: currentCharacter.characterUrl!, into: TopImageView)
//        characterNameLabel.text = " \(currentCharacter.characterName!)"
//        var myAttributtedText = retrivingAttributedText(description: currentCharacter.description!)
//        
//        MiddleTextView.attributedText = myAttributtedText
//        
//        
//    var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
//    
//        
//    visualEffectView.frame = view.bounds
//    
//    view.addSubview(visualEffectView)
//    
//    view.addSubview(popUpView)
//    popUpView.addSubview(TopImageView)
//    popUpView.addSubview(MiddleView)
//        popUpView.addSubview(MiddleTextView)
//    popUpView.addSubview(BottomView)
//    popUpView.addSubview(characterNameLabel)
//   
//        popUpView.addSubview(separeteView)
//        popUpView.addSubview(backButton)
//        popUpView.addSubview(siteButton)
//        
//    
//        
//    
//    popUpView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
//    popUpView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
//    popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    
//    MiddleTextView.centerYAnchor.constraint(equalTo: MiddleView.centerYAnchor, constant: MiddleView.frame.height/2 + 15).isActive = true
//    MiddleTextView.leadingAnchor.constraint(equalTo: MiddleView.leadingAnchor, constant: 10).isActive = true
//         MiddleTextView.trailingAnchor.constraint(equalTo: MiddleView.trailingAnchor, constant: -10).isActive = true
//    
//    TopImageView.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 0).isActive = true
//    TopImageView.heightAnchor.constraint(equalTo: popUpView.heightAnchor, multiplier: 0.25).isActive = true
//    TopImageView.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
//    TopImageView.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
//        
//
//      
//    
//    MiddleView.topAnchor.constraint(equalTo: TopImageView.bottomAnchor, constant: 0).isActive = true
//   MiddleView.heightAnchor.constraint(equalTo: popUpView.heightAnchor, multiplier: 0.65).isActive = true
//    MiddleView.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 0).isActive = true
//    MiddleView.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: 0).isActive = true
//    
//       
//        
//    
//        
//    BottomView.topAnchor.constraint(equalTo: MiddleView.bottomAnchor, constant: 0).isActive = true
//    BottomView.heightAnchor.constraint(equalTo: popUpView.heightAnchor, multiplier: 0.1).isActive = true
//    BottomView.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
//    BottomView.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
//        
//    characterNameLabel.topAnchor.constraint(equalTo: MiddleView.topAnchor, constant: 10).isActive = true
//        characterNameLabel.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 10).isActive = true
//        characterNameLabel.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
//        
//        
//       separeteView.topAnchor.constraint(equalTo: MiddleView.bottomAnchor).isActive = true
//        separeteView.bottomAnchor.constraint(equalTo: BottomView.bottomAnchor).isActive = true
//        separeteView.widthAnchor.constraint(equalToConstant: 1).isActive = true
//        separeteView.centerXAnchor.constraint(equalTo: BottomView.centerXAnchor).isActive = true
//       
//        
//        backButton.leadingAnchor.constraint(equalTo: BottomView.leadingAnchor, constant: 5).isActive = true
//        backButton.trailingAnchor.constraint(equalTo: separeteView.leadingAnchor, constant: 5).isActive = true
//        backButton.centerYAnchor.constraint(equalTo: BottomView.centerYAnchor).isActive = true
//        
//        siteButton.leadingAnchor.constraint(equalTo: separeteView.trailingAnchor, constant: 5).isActive = true
//        siteButton.trailingAnchor.constraint(equalTo: BottomView.trailingAnchor, constant: -5).isActive = true
//        siteButton.centerYAnchor.constraint(equalTo: BottomView.centerYAnchor).isActive = true
//      
//        
//        
//}
//    
//   
//
//}
