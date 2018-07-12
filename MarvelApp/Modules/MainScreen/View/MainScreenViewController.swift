//
//  MainScreenViewController.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 22/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class MainScreenViewController: BaseViewController , UICollectionViewDelegateFlowLayout  {
    
    // MARK: Properties
    var reuse = "cell"
    var loading = false
    var presenter: MainScreenPresentation?
    var urlToGo : String?
    var searchActive = false
    var myCharacters = [MarvelData]()
    var filteredCharacters = [MarvelData]()
    var specificCharacter = [MarvelData]()
    var popUp : UIView?
    var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    var fullLayout = true
    
    
    //////////////**  Creating Home Interface **\\\\\\\\\\\\\\
    
    var backWallpaper = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "wallpaper2"), contentMode: .scaleAspectFill)
    
    var statusBarView = GlobalComponents().createViewWith(backgroundColor: .clear)
    
    let searchBar = GlobalComponents().createSearchBar(placeholder: "Search your favorite character :)", color: .myRedColor)
    
    let marvelCollectionView = GlobalComponents().createCollectionView(scrollDirection: .vertical, backgroundColor: .clear)
    
    var topView = GlobalComponents().createViewWith(backgroundColor: .myRedColor)
    
    var layoutButton = GlobalComponents().createButtonWithImage(image: #imageLiteral(resourceName: "icGrid"))
    
    var marvelLogo = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "marvel"), contentMode: .scaleAspectFit)
    
    var menuName = GlobalComponents().createSimpleLabel(text: "Characters", textColor: .white, font: .headerNegrito)
    //////////////**  Home Interface Done **\\\\\\\\\\\\\\
    
    //////////////**  Creating Anchors to make possible 2 layouts **\\\\\\\\\\\\\\
    // * Layout 1
    var listLayoutTop : NSLayoutConstraint?
    var listLayoutLeading : NSLayoutConstraint?
    var listLayoutTrailing : NSLayoutConstraint?
    var listLayoutBottom : NSLayoutConstraint?
    
    // * Layout 2
    var gridLayoutTop : NSLayoutConstraint?
    var gridLayoutLeading : NSLayoutConstraint?
    var gridLayoutTrailing : NSLayoutConstraint?
    var gridLayoutBottom : NSLayoutConstraint?
    //////////////**  Anchors Done **\\\\\\\\\\\\\\
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUpMyCollection()
        hideKeyboardWhenTappedAround()
        setupLayout()
        setupUpMySearchBar()
        setupComponentsThings()
        loading = true
        presenter?.requestCharactersInfo(filtered: false, text: nil)
    }
    
    func setupComponentsThings() {
        layoutButton.addTarget(self, action: #selector(changeLayout), for: .touchUpInside)
    }
    
    func setupUpMyCollection() {
        marvelCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        marvelCollectionView.dataSource = self
        marvelCollectionView.delegate = self
    }
    
    func setupUpMySearchBar() {
        searchBar.delegate = self
        searchBar.keyboardType = .default
        searchBar.keyboardAppearance = .dark
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch? = touches.first
        if touch?.view == visualEffectView {
            dismissPopUp()
        }
    }
}
extension MainScreenViewController: MainScreenView {
    func updateFilterWithNewCharacters(withData: [MarvelData?]) {
        if !withData.isEmpty {
            for characters in withData {
                let myBool =  myCharacters.contains(where: { (myData) -> Bool in
                    if myData.characterName == characters?.characterName {
                        return true
                    }
                    else {
                        return false
                    }
                })
                if !myBool {
                    let myBool2 =  specificCharacter.contains(where: { (myData) -> Bool in
                        if myData.characterName == characters?.characterName {
                            return true
                        }
                        else {
                            return false
                        }
                    })
                    if !myBool2 {
                        specificCharacter.append(characters!)
                    }
                }
            }
        }
        hideLoading()
        loading = false
    }
    
    func updateViewWithNewCharacters(withData: [MarvelData?]) {
        for character in withData {
            myCharacters.append(character!)
        }
        Constants.offSet = myCharacters.count
        marvelCollectionView.reloadData()
        loading = false
    }
}

