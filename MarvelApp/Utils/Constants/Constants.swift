//
//  Constants.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 17/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit
import Foundation
import CryptoSwift

enum Constants {
    
    static var marvelURL = "https://gateway.marvel.com/"
    static var publicKey = "12c4c7126e88ed68091675f8de64eb00"
    static var privateKey = "f33bac2133dc084269ae8b6a16d8cff90b3868bf"
    static var characters = "/v1/public/characters"
    static var ts = String(NSDate().timeIntervalSince1970.description)
    static var limitPerRequest = 8
    static var hash = (Constants.ts + Constants.privateKey + Constants.publicKey).md5()
    static var offSet = 0
    static var nameStartsWith = ""
    
    
}









