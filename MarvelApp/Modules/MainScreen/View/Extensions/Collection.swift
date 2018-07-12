//
//  MainScreenViewControllerExtension.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit
import Nuke

extension MainScreenViewController : UICollectionViewDelegate, UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        if !loading && indexPath.row + 1  == Constants.offSet && !searchActive {
            presenter?.requestCharactersInfo(filtered: false, text: nil)
            loading = true
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if fullLayout{ return 0 }
        else { return 10 }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return filteredCharacters.count
        }
        return myCharacters.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return myCollectionSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath) as! CollectionViewCell
        
        if myCharacters.count > 0 && !searchActive {
            cell.characterLabel.text = myCharacters[indexPath.item].characterName
            
            let stringUrl = String(describing: myCharacters[indexPath.item].characterUrl)
            let myBool = stringUrl.contains("image_not_available")
            if myCharacters[indexPath.item].characterUrl != nil && !myBool {
                
                cell.characterImageView.image = nil
                
                Nuke.Manager.shared.loadImage(with: myCharacters[indexPath.item].characterUrl!) { (result) in
                    if result.error != nil {
                        cell.characterImageView.image = #imageLiteral(resourceName: "marvel-1")
                    }
                    else {
                        cell.characterImageView.image = result.value
                    }
                }
            }
            else {
                cell.characterImageView.image = nil
                cell.characterImageView.image = #imageLiteral(resourceName: "marvel-1")
            }
            hideLoading()
            loading = false
            
        }
        
        if searchActive {
            cell.characterLabel.text = filteredCharacters[indexPath.item].characterName
            let stringUrl = String(describing: filteredCharacters[indexPath.item].characterUrl)
            let myBool = stringUrl.contains("image_not_available")
            if filteredCharacters[indexPath.item].characterUrl != nil && !myBool {
                cell.characterImageView.image = nil
                Nuke.Manager.shared.loadImage(with: filteredCharacters[indexPath.item].characterUrl!) { (result) in
                    if result.error != nil {
                        cell.characterImageView.image = #imageLiteral(resourceName: "marvel-1")
                    }
                    else {
                        cell.characterImageView.image = result.value
                    }
                }
            }
            else {
                cell.characterImageView.image = nil
                cell.characterImageView.image = #imageLiteral(resourceName: "marvel-1")
            }
        }
        cell.backgroundColor = UIColor.myRedColor
        cell.layer.borderWidth = 1.5
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentCharacterInfo(view: self.view, forRow: indexPath.row, filtered: searchActive)
    }
}
