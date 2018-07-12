//
//  AppLayoutGuides.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 11/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class AppLayoutGuides {
    var deviceForLayout = deviceModel.iphone7  // Choose your device model for Layout.
    lazy var proportion : CGFloat = {
        return  (UIScreen.main.bounds.height / deviceForLayout.rawValue)
    }()
}

enum deviceModel : CGFloat {
    case iphone7 = 736
}

enum AppFonts {
    case normal
    case normalNegrito
    case header
    case headerNegrito
    case small
    case smallBlack
    case smallest
    case big
    case bigNegrito
}
