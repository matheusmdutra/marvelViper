//
//  PopUpExtension.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 22/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit
import Nuke
extension MainScreenViewController {

    func retrivingAttributedText(description: String, characterName: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Character: \(characterName)\n\n" , attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor : UIColor.white ])
        
        attributedText.append(NSMutableAttributedString(string: "\(description)", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white , NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16), ]))
        return attributedText
    }
    
    func presentCharacterInfo(view: UIView , forRow: Int, filtered: Bool) {
        updateUI(forRow, filtered)
        visualEffectView.alpha = 0
        view.addSubview(visualEffectView)
        visualEffectView.frame = view.bounds
        popUpEntireView.alpha = 0
        view.addSubview(popUpEntireView)
        animateView()
        //
        popUpEntireView.addSubview(popUpTopImageView)
        popUpEntireView.addSubview(popUpmiddleView)
        popUpEntireView.addSubview(popUpbottomView)
        //
        popUpmiddleView.addSubview(popUpmiddleTextView)
        //
        popUpbottomView.addSubview(popUpSepareteView)
        popUpbottomView.addSubview(popUpbackButton)
        popUpbottomView.addSubview(popUpsiteButton)
        //)
        
        NSLayoutConstraint.activate([
            
            // PopUp Constrain
            popUpEntireView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            popUpEntireView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            popUpEntireView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popUpEntireView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // TopView Constrain
            popUpTopImageView.topAnchor.constraint(equalTo: popUpEntireView.topAnchor),
            popUpTopImageView.trailingAnchor.constraint(equalTo: popUpEntireView.trailingAnchor),
            popUpTopImageView.leadingAnchor.constraint(equalTo: popUpEntireView.leadingAnchor),
            popUpTopImageView.heightAnchor.constraint(equalTo: popUpEntireView.heightAnchor, multiplier: 0.35),
            
            // MiddleView Constrain
            popUpmiddleView.topAnchor.constraint(equalTo: popUpTopImageView.bottomAnchor),
            popUpmiddleView.trailingAnchor.constraint(equalTo: popUpEntireView.trailingAnchor),
            popUpmiddleView.leadingAnchor.constraint(equalTo: popUpEntireView.leadingAnchor),
            popUpmiddleView.heightAnchor.constraint(equalTo: popUpEntireView.heightAnchor, multiplier: 0.55),
            
            // PopUpMiddleTextView
            popUpmiddleTextView.topAnchor.constraint(equalTo: popUpmiddleView.topAnchor, constant: 10),
            popUpmiddleTextView.trailingAnchor.constraint(equalTo: popUpEntireView.trailingAnchor, constant: -5),
            popUpmiddleTextView.leadingAnchor.constraint(equalTo: popUpEntireView.leadingAnchor, constant: 5),
            popUpmiddleTextView.bottomAnchor.constraint(equalTo: popUpmiddleView.bottomAnchor, constant: 10),
            
            // BottomView Constrain
            popUpbottomView.topAnchor.constraint(equalTo: popUpmiddleView.bottomAnchor),
            popUpbottomView.trailingAnchor.constraint(equalTo: popUpEntireView.trailingAnchor),
            popUpbottomView.leadingAnchor.constraint(equalTo: popUpEntireView.leadingAnchor),
            popUpbottomView.heightAnchor.constraint(equalTo: popUpEntireView.heightAnchor, multiplier: 0.10),
            
            // Adding Separeter View
            popUpSepareteView.topAnchor.constraint(equalTo: popUpmiddleView.bottomAnchor),
            popUpSepareteView.centerXAnchor.constraint(equalTo: popUpbottomView.centerXAnchor),
            popUpSepareteView.bottomAnchor.constraint(equalTo: popUpbottomView.bottomAnchor),
            popUpSepareteView.widthAnchor.constraint(equalToConstant: 1),
            
            // Adding Two Buttons
            popUpbackButton.centerYAnchor.constraint(equalTo: popUpbottomView.centerYAnchor),
            popUpbackButton.trailingAnchor.constraint(equalTo: popUpSepareteView.leadingAnchor, constant: -10),
            popUpbackButton.leadingAnchor.constraint(equalTo: popUpbottomView.leadingAnchor, constant: 10),
            
            popUpsiteButton.centerYAnchor.constraint(equalTo: popUpbottomView.centerYAnchor),
            popUpsiteButton.trailingAnchor.constraint(equalTo: popUpbottomView.trailingAnchor, constant: -10),
            popUpsiteButton.leadingAnchor.constraint(equalTo: popUpSepareteView.trailingAnchor, constant: 10),
            
            ])
    }
    
    func updateUI(_ row: Int, _ filter: Bool){
        var currentCharacter : MarvelData!
        if filter {
            currentCharacter = filteredCharacters[row]
        }
        else {
            currentCharacter = myCharacters[row]
        }
        
        if currentCharacter.urlDescription != nil {
            urlToGo = currentCharacter.urlDescription
        }
        var stringUrl = String(describing: currentCharacter.characterUrl)
        var myBool = stringUrl.contains("image_not_available")
        
        // Updating Image
        if currentCharacter.characterUrl != nil && !myBool {
            popUpTopImageView.image = nil
            Nuke.Manager.shared.loadImage(with: currentCharacter.characterUrl!, into: popUpTopImageView)
        }
        else {
            popUpTopImageView.image = #imageLiteral(resourceName: "marvel-1")
        }
        // Updating Text
        if (currentCharacter.description?.count)! > 5 {
            var myAttributtedText = retrivingAttributedText(description: currentCharacter.description!, characterName: currentCharacter.characterName!)
            popUpmiddleTextView.attributedText = myAttributtedText
        }
        else {
            var myAttributtedText = retrivingAttributedText(description: "No description avaliable :/", characterName: currentCharacter.characterName!)
            popUpmiddleTextView.attributedText = myAttributtedText
        }
    }
    
    func animateView() {
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.alpha = 1
            self.popUpEntireView.alpha = 1
        }
    }
}


