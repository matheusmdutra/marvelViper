//
//  Character.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

struct APIResponse : Decodable {
    var etag: String?
    var code: Int?
    var status: String?
    var data: DataStruct?
}

struct DataStruct : Decodable {
    var limit : Int?
    var results: [CharactersInfo]?
}

struct ThumbNail : Decodable {
    var path : String?
}

struct CharactersInfo : Decodable {
    var thumbnail : ThumbNail?
    var name: String?
    var urls: [Urls]?
    var description : String?
}

struct Urls : Decodable {
    var url : String?
}




