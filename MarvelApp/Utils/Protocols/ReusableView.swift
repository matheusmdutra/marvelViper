//
//  ReusableView.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit


protocol ReusableView: class {}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
