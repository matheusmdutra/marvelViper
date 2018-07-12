//
//  ComplexComponents.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 11/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class ComplexComponents {
    
    func createViewWith(backgroundColor: UIColor?, borderWidht: CGFloat?, borderColor: UIColor?, cornerRadius: CGFloat?, maskedCorners: [CACornerMask]?) -> UIView {
        let mView = UIView()
        mView.backgroundColor = backgroundColor
        if let corner = cornerRadius {mView.layer.cornerRadius = corner}
        mView.clipsToBounds = true
        mView.translatesAutoresizingMaskIntoConstraints = false
        if let border = borderWidht {mView.layer.borderWidth = border}
        mView.layer.borderColor = borderColor?.cgColor
        if let masked = maskedCorners {
        masked.forEach {
            mView.layer.maskedCorners = $0
        }
        }
        return mView
    }
    
    func createCustomImageViewWith(image: UIImage?, contentMode: UIViewContentMode, backgroundColor: UIColor, cornerRadius: CGFloat, maskedCorners: [CACornerMask]) -> UIImageView {
        
        let myTopImageView = UIImageView()
        myTopImageView.image = image
        myTopImageView.contentMode = contentMode
        myTopImageView.translatesAutoresizingMaskIntoConstraints = false
        myTopImageView.clipsToBounds = true
        myTopImageView.layer.cornerRadius = cornerRadius
        myTopImageView.backgroundColor = backgroundColor
        maskedCorners.forEach {
        myTopImageView.layer.maskedCorners = $0
        }
        return myTopImageView
    }
    
}
