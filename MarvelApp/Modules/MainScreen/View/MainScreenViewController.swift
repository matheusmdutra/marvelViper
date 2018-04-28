//
//  MainScreenViewController.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 22/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class MainScreenViewController: BaseViewController, StoryboardLoadable , UICollectionViewDelegateFlowLayout  {
    
    // MARK: Properties
    var reuse = "cell"
    var loading = false
    var presenter: MainScreenPresentation?
    var urlToGo : String?
    var searchActive = false
    var myCharacters = [MarvelData]()
    var filteredCharacters = [MarvelData]()
    var specificCharacter = [MarvelData]()
    var fullLayout = true
    
    //////////////**  Creating Home Interface **\\\\\\\\\\\\\\
    
    // Creating My background wallpaper
    var backWallpaper : UIImageView = {
        let myBackWallpaper = UIImageView()
        myBackWallpaper.image = #imageLiteral(resourceName: "wallpaper2")
        myBackWallpaper.contentMode = .scaleAspectFill
        myBackWallpaper.translatesAutoresizingMaskIntoConstraints = false
        // Creating Marvel Logo
        return myBackWallpaper
    }()
    
    // Creating My search bar
    let searchBar : UISearchBar = {
        let mSearchBar = UISearchBar()
        mSearchBar.placeholder = "Search your favorite character :)"
        mSearchBar.barStyle = .default
        mSearchBar.barTintColor = UIColor.myRedColor
        mSearchBar.returnKeyType = .done
        mSearchBar.translatesAutoresizingMaskIntoConstraints = false
        return mSearchBar
    }()
    
    // Creating My Status Bar View
    var statusBarView : UIView = {
        let myStatusBar = UIView()
        myStatusBar.backgroundColor = UIColor.myRedColor
        myStatusBar.translatesAutoresizingMaskIntoConstraints = false
        return myStatusBar
    }()
    
    // Creating My Collection View
    var marvelCollectionView : UICollectionView = {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .vertical
        var frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let myMarvelCollectionView = UICollectionView(frame: frame, collectionViewLayout: myLayout)
        myMarvelCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myMarvelCollectionView.backgroundColor = .clear
        myMarvelCollectionView.contentMode = .scaleAspectFill
        return myMarvelCollectionView
    }()
    
    // Anchors Collection
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
    
    // Creating My Top View
    var topView : UIView = {
        let myTopView = UIView()
        myTopView.backgroundColor = UIColor.myRedColor
        myTopView.translatesAutoresizingMaskIntoConstraints = false
        // Creating Marvel Logo
        return myTopView
    }()
    
    var layoutButton : UIButton = {
        var myLayoutButton = UIButton()
        myLayoutButton.setBackgroundImage(#imageLiteral(resourceName: "icGrid"), for: .normal)
        
        myLayoutButton.translatesAutoresizingMaskIntoConstraints = false
        myLayoutButton.addTarget(self, action: #selector(changeLayout), for: .touchUpInside)
        return myLayoutButton
    }()
    
    @objc func changeLayout() {
        fullLayout = !fullLayout
        
        if !fullLayout {
            layoutButton.setBackgroundImage(#imageLiteral(resourceName: "icList"), for: .normal)
            listLayoutBottom!.isActive = false
            listLayoutTrailing!.isActive = false
            listLayoutLeading!.isActive = false
            listLayoutTop!.isActive = false
            gridLayoutBottom!.isActive = true
            gridLayoutTrailing!.isActive = true
            gridLayoutTop!.isActive = true
            gridLayoutLeading!.isActive = true
        }
        else {
            layoutButton.setBackgroundImage(#imageLiteral(resourceName: "icGrid"), for: .normal)
            listLayoutBottom!.isActive = true
            listLayoutTrailing!.isActive = true
            listLayoutLeading!.isActive = true
            listLayoutTop!.isActive = true
            gridLayoutBottom!.isActive = false
            gridLayoutTrailing!.isActive = false
            gridLayoutTop!.isActive = false
            gridLayoutLeading!.isActive = false
        }
        marvelCollectionView.reloadData()
        marvelCollectionView.layoutIfNeeded()
        
        marvelCollectionView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.marvelCollectionView.alpha = 1
        }
    }
    var marvelLogo : UIImageView = {
        var myMarvelLogo = UIImageView()
        myMarvelLogo.image = #imageLiteral(resourceName: "marvel")
        myMarvelLogo.translatesAutoresizingMaskIntoConstraints = false
        return myMarvelLogo
    }()
    
    var menuName : UILabel = {
        var myMenuName = UILabel()
        myMenuName.font = UIFont.boldSystemFont(ofSize: 23)
        myMenuName.backgroundColor = .clear
        myMenuName.textColor = UIColor.white
        myMenuName.text = "Characters"
        myMenuName.translatesAutoresizingMaskIntoConstraints = false
        return myMenuName
    }()
    //////////////**  Home Interface Done **\\\\\\\\\\\\\\
    
    override func viewDidLoad() {
        creratingTwoLayouts()
        super.viewDidLoad()
        setupUpMyCollection()
        hideKeyboardWhenTappedAround()
        setupLayout()
        setupUpMySearchBar()
        presenter?.requestCharactersInfo(filtered: false, text: nil)
        loading = true
    }
    
    func creratingTwoLayouts() {
        // List Layout
        listLayoutTop = marvelCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0)
        listLayoutLeading = marvelCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        listLayoutTrailing = marvelCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        listLayoutBottom =  marvelCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        // Grid Layout
        gridLayoutTop =  marvelCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10)
        gridLayoutLeading = marvelCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        gridLayoutTrailing = marvelCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        gridLayoutBottom = marvelCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
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
    //////////////**  Creating My Personalized Pop Up :) **\\\\\\\\\\\\\\
    
    var popUpTopImageView : UIImageView = {
        let myTopImageView = UIImageView()
        myTopImageView.image = nil
        myTopImageView.contentMode = .scaleAspectFill
        myTopImageView.translatesAutoresizingMaskIntoConstraints = false
        myTopImageView.clipsToBounds = true
        myTopImageView.layer.cornerRadius = 10
        myTopImageView.backgroundColor = UIColor.darkGray
        myTopImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return myTopImageView
    }()
    
    var popUpmiddleView : UIView = {
        let myMiddleView = UIView()
        myMiddleView.translatesAutoresizingMaskIntoConstraints = false
        myMiddleView.backgroundColor = UIColor.myRedColor
        myMiddleView.layer.borderWidth = 1
        myMiddleView.layer.borderColor = UIColor.darkGray.cgColor
        return myMiddleView
    }()
    var popUpmiddleTextView : UITextView = {
        let myMiddleTextView = UITextView()
        myMiddleTextView.backgroundColor = UIColor.clear
        myMiddleTextView.textColor = UIColor.white
        myMiddleTextView.isUserInteractionEnabled = false
        myMiddleTextView.translatesAutoresizingMaskIntoConstraints = false
        return myMiddleTextView
    }()
    var popUpbottomView : UIView = {
        let myBottomView = UIView()
        myBottomView.translatesAutoresizingMaskIntoConstraints = false
        myBottomView.clipsToBounds = true
        myBottomView.layer.cornerRadius = 10
        myBottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        myBottomView.backgroundColor = UIColor.myRedColor
        return myBottomView
    }()
    
    var popUpEntireView : UIView = {
        let myPopUpView = UIView()
        myPopUpView.clipsToBounds = true
        myPopUpView.layer.cornerRadius = 10
        myPopUpView.layer.borderWidth = 1
        myPopUpView.layer.borderColor = UIColor.black.cgColor
        myPopUpView.backgroundColor = UIColor.darkGray
        myPopUpView.translatesAutoresizingMaskIntoConstraints = false
        return myPopUpView
    }()
    
    var popUpbackButton : UIButton = {
        var myBackButton = UIButton()
        myBackButton.setTitle("Back", for: .normal)
        myBackButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        myBackButton.translatesAutoresizingMaskIntoConstraints = false
        myBackButton.addTarget(self, action: #selector(dismissPopUp), for: .touchUpInside)
        return myBackButton
    }()
    
    var popUpsiteButton : UIButton = {
        var mySiteButton = UIButton()
        mySiteButton.setTitle("More info", for: .normal)
        mySiteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        mySiteButton.translatesAutoresizingMaskIntoConstraints = false
        mySiteButton.addTarget(self, action: #selector(goToWebSite), for: .touchUpInside)
        return mySiteButton
    }()

    var popUpSepareteView: UIView = {
        var mysepareteView = UIView()
        mysepareteView.backgroundColor = UIColor.darkGray
        mysepareteView.translatesAutoresizingMaskIntoConstraints = false
        return mysepareteView
    }()
    
    var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    func setupLayout() {
        // Adding SubViews
        view.addSubview(backWallpaper)
        view.addSubview(statusBarView)
        view.addSubview(searchBar)
        //
        view.addSubview(topView)
        topView.addSubview(marvelLogo)
        topView.addSubview(menuName)
        topView.addSubview(layoutButton)
        //
        view.addSubview(marvelCollectionView)
        
        NSLayoutConstraint.activate([
            
            // Setting My Wallpaper
            backWallpaper.topAnchor.constraint(equalTo: view.topAnchor),
            backWallpaper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backWallpaper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backWallpaper.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Setting My Status Bar
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.heightAnchor.constraint(equalToConstant: 20),
            
            // Setting My Top View
            topView.topAnchor.constraint(equalTo: statusBarView.bottomAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.080),
            //
            layoutButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            layoutButton.heightAnchor.constraint(equalToConstant: 25),
            layoutButton.widthAnchor.constraint(equalToConstant: 25),
            layoutButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            //
            marvelLogo.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            marvelLogo.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.85),
            marvelLogo.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.2),
            marvelLogo.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            //
            menuName.leadingAnchor.constraint(equalTo: marvelLogo.trailingAnchor, constant: 10),
            
            menuName.trailingAnchor.constraint(greaterThanOrEqualTo: topView.trailingAnchor, constant: -10),
            menuName.heightAnchor.constraint(equalTo: marvelLogo.heightAnchor, multiplier: 1.0),
            menuName.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            // SearchBar
            searchBar.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0.0),
            searchBar.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            // Initial Layout
            listLayoutTop!,
            listLayoutLeading!,
            listLayoutTrailing!,
            listLayoutBottom!
            
            ])
    }
    
    @objc func dismissPopUp() {
        self.popUpbackButton.titleLabel?.alpha = 0.3
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpEntireView.alpha = 0
            self.visualEffectView.alpha = 0
            self.popUpbackButton.titleLabel?.alpha = 1
        })
        { (success:Bool) in
            self.popUpEntireView.removeFromSuperview()
            self.visualEffectView.removeFromSuperview()
        }
    }
    
    @objc func goToWebSite() {
        self.popUpsiteButton.titleLabel?.alpha = 0.3
        UIView.animate(withDuration: 0.3) {
            self.popUpsiteButton.titleLabel?.alpha = 1
            UIApplication.shared.openURL(NSURL(string: self.urlToGo!)! as URL)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch : UITouch? = touches.first
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
