//
//  DetailView.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit


class DetailView {
    
    
    static var sharedInstance = DetailView()
    
    var TopImageView : UIImageView = {
        var myTopImageView = UIImageView()
        myTopImageView.translatesAutoresizingMaskIntoConstraints = false
        return myTopImageView
    }()
    
    var MiddleImageView : UIImageView = {
        var myMiddleImageView = UIImageView()
        myMiddleImageView.translatesAutoresizingMaskIntoConstraints = false
        return myMiddleImageView
    }()
    
    var BottomImageView : UIImageView = {
        var myBottomImageView = UIImageView()
        myBottomImageView.translatesAutoresizingMaskIntoConstraints = false
        return myBottomImageView
    }()
    
    var wallpaper : UIImageView = {
        var myWallpaper = UIImageView()
        myWallpaper.image = #imageLiteral(resourceName: "wallpaper1")
        myWallpaper.translatesAutoresizingMaskIntoConstraints = false
        return myWallpaper
    }()
    
    var characterView : UIView = {
        var mCharacterView = UIView()
        return mCharacterView
    }()
    
    
    func setupDetailView() -> UIView {
        
        characterView.addSubview(TopImageView)
        ch
    }
}
