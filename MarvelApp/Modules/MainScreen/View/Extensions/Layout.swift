//
//  Layout.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 23/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension MainScreenViewController {
    
    func setupLayout() {
       
        view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        // Check if is IphoneX
        let window = UIApplication.shared.keyWindow
        var safeAreaTop = window?.safeAreaInsets.top
        if let safe = safeAreaTop {
            if Int(safe) == 0 {
                safeAreaTop = 20
            }
        }
        
        // List Layout
        listLayoutTop = marvelCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0)
        listLayoutLeading = marvelCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        listLayoutTrailing = marvelCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        listLayoutBottom =  marvelCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        // Grid Layout
        gridLayoutTop =  marvelCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10)
        gridLayoutLeading = marvelCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        gridLayoutTrailing = marvelCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        gridLayoutBottom = marvelCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        [backWallpaper,statusBarView,searchBar,topView,marvelCollectionView].forEach{view.addSubview($0)}
        
        [marvelLogo,menuName,layoutButton].forEach{topView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            
            backWallpaper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backWallpaper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backWallpaper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backWallpaper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.heightAnchor.constraint(equalToConstant: safeAreaTop ?? 20),
            
            topView.topAnchor.constraint(equalTo: statusBarView.bottomAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.080),
            
            layoutButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            layoutButton.heightAnchor.constraint(equalToConstant: 25),
            layoutButton.widthAnchor.constraint(equalToConstant: 25),
            layoutButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            marvelLogo.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 5),
            marvelLogo.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.85),
            marvelLogo.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.2),
            marvelLogo.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            menuName.leadingAnchor.constraint(equalTo: marvelLogo.trailingAnchor, constant: 10),
            menuName.trailingAnchor.constraint(greaterThanOrEqualTo: topView.trailingAnchor, constant: -10),
            menuName.heightAnchor.constraint(equalTo: marvelLogo.heightAnchor, multiplier: 1.0),
            menuName.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
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
    
    func  myCollectionSize() -> CGSize {
        if !fullLayout {
            let padding: CGFloat =  10
            let collectionViewSize = marvelCollectionView.frame.width - padding
            return CGSize(width: collectionViewSize/2 , height: collectionViewSize/2)
        }
        else {
            let collectionViewSize = UIScreen.main.bounds.width
            return CGSize(width: collectionViewSize , height: collectionViewSize/2.25)
        }
    }
}
