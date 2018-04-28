//
//  MarvelData.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit


struct MarvelData {
    
    var description : String?
    var characterName : String?
    var characterUrl : URL?
    var allCharacters = [MarvelData]()
    var imageLoaded = false
    var urlDescription : String?
    
    init (name: String?, url: URL? , description: String? , urlDescription: String?) {
        self.characterName = name
        self.characterUrl = url
        self.description = description
        self.urlDescription = urlDescription
    }
    
}

class AllCharacters {
    
    static var sharedInstance = AllCharacters()
    var allCharacters = [MarvelData]()
}
