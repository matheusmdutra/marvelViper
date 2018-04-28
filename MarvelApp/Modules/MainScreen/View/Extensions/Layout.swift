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
