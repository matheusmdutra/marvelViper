//
//  UIFont.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 11/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension UIFont  {
    func retrieveAppFont(named: AppFonts) -> UIFont {
        switch named {
        case .normal:
            return UIFont.systemFont(ofSize: AppLayoutGuides().proportion * 14)
        case .small:
            return UIFont.systemFont(ofSize: AppLayoutGuides().proportion * 13)
        case .smallest:
            return UIFont.systemFont(ofSize: AppLayoutGuides().proportion * 12)
        case .big:
            return UIFont.boldSystemFont(ofSize: AppLayoutGuides().proportion * 19)
        case .bigNegrito:
            return UIFont.boldSystemFont(ofSize: AppLayoutGuides().proportion * 19)
        case .headerNegrito:
            return UIFont.boldSystemFont(ofSize: AppLayoutGuides().proportion * 22)
        case .header:
            return UIFont.systemFont(ofSize: AppLayoutGuides().proportion * 22)
        default:
            return UIFont.systemFont(ofSize: AppLayoutGuides().proportion * 15)
        }
    }
}
