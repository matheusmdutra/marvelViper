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
        popUp!.alpha = 0
        view.addSubview(popUp!)
        animateView()
    }
    
    func updateUI(_ row: Int, _ filter: Bool){
        var currentCharacter : MarvelData!
        var image : UIImage?
        var text : NSAttributedString?
        
        if filter {
            currentCharacter = filteredCharacters[row]
        }
        else {
            currentCharacter = myCharacters[row]
        }
        
        if currentCharacter.urlDescription != nil {
            urlToGo = currentCharacter.urlDescription
        }
        let stringUrl = String(describing: currentCharacter.characterUrl)
        let myBool = stringUrl.contains("image_not_available")
        
        // Updating Image
        if currentCharacter.characterUrl != nil && !myBool {
            image = nil
            let imageView = UIImageView()
            Nuke.Manager.shared.loadImage(with: currentCharacter.characterUrl!, into: imageView)
            image = imageView.image
        }
        else { image = #imageLiteral(resourceName: "marvel-1") }
        // Updating Text
        if (currentCharacter.description?.count)! > 5 {
            text = retrivingAttributedText(description: currentCharacter.description!, characterName: currentCharacter.characterName!)
        }
        else {
            text = retrivingAttributedText(description: "No description avaliable :/", characterName: currentCharacter.characterName!)
        }
        popUp = CustomPopUp(view: view, text: text!, image: image ?? nil, source: self).popUpView()
    }
    
    func animateView() {
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.alpha = 1
            self.popUp!.alpha = 1
        }
    }
    
    @objc func dismissPopUp() {
        UIView.animate(withDuration: 0.3, animations: {
            self.popUp!.alpha = 0
            self.visualEffectView.alpha = 0
        })
        { (success:Bool) in
            self.popUp!.removeFromSuperview()
            self.visualEffectView.removeFromSuperview()
        }
    }
    
    @objc func goToWebSite() {
        UIView.animate(withDuration: 0.3) {
            UIApplication.shared.openURL(NSURL(string: self.urlToGo!)! as URL)
        }
    }
    
}


