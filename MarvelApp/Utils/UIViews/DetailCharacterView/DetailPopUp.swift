//
//  PopUpCampaignController.swift
//  DeliveryMuch
//
//  Created by Matheus Dutra on 26/03/2018.
//  Copyright © 2018 Delivery Much. All rights reserved.
//

import UIKit

class DetailPopUp: UIViewController {
    
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
    
    func fetchView(campaing: CharacterDetail ) {
        
    }
    
    override func viewDidLoad() {
      
    
        super.viewDidLoad()
        setupPopUp()
  self.preferredContentSize = CGSize(width: 300, height: 300)
        
        // Do any additional setup after loading the view.
    }
    
    
    func setupPopUp() {
    
//        view.frame.size = CGSize(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.8)
    
        
        view.backgroundColor = UIColor.darkGray
        TopImageView.backgroundColor = UIColor.myRedColor
        MiddleImageView.backgroundColor = UIColor.myWhiteColor
        BottomImageView.backgroundColor = UIColor.myRedColor
        view.addSubview(TopImageView)
        view.addSubview(MiddleImageView)
        view.addSubview(BottomImageView)
        
        
          NSLayoutConstraint.activate([
            
            // Top View Constrains
            TopImageView.topAnchor.constraint(equalTo: view.topAnchor),
            TopImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TopImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TopImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            // Middle View Constrains
            MiddleImageView.topAnchor.constraint(equalTo: TopImageView.bottomAnchor),
            MiddleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MiddleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MiddleImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            // Bottom View Constrains
            
            BottomImageView.topAnchor.constraint(equalTo: MiddleImageView.bottomAnchor),
            BottomImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            BottomImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            BottomImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
            
            
            
            
            
            
            ])
        // Top View Constrains
        

//        view.addSubview(wallpaper)
//
//
//        wallpaper.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        wallpaper.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        wallpaper.topAnchor.constraint(equalTo: view.topAnchor ).isActive = true
//        wallpaper.bottomAnchor.constraint(equalTo:view.bottomAnchor ).isActive = true
        
       
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


