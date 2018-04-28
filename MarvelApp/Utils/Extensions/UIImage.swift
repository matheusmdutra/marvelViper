//
//  UIImage.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setRounded() {

        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.myRedColor.cgColor
        
    }
}

