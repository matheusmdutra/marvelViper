//
//  GlobalComponents.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 11/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class GlobalComponents {
    
    func createViewWith(backgroundColor: UIColor?) -> UIView {
        let mView = UIView()
        mView.backgroundColor = backgroundColor
        mView.translatesAutoresizingMaskIntoConstraints = false
        return mView
    }
    
    func createImageViewWith(image: UIImage?, contentMode: UIViewContentMode?) -> UIImageView {
        let mImageView = UIImageView()
        mImageView.image = image
        mImageView.clipsToBounds = true
        mImageView.translatesAutoresizingMaskIntoConstraints = false
        if contentMode != nil { mImageView.contentMode = contentMode! }
        return mImageView
    }
    
    func createTextFieldWith(text: String, placeHolder: String, keyboardType: UIKeyboardType, backgroundColor: UIColor, font: AppFonts, corner : CGFloat) -> UITextField {
        let mTextField = UITextField()
        mTextField.backgroundColor = backgroundColor
        mTextField.translatesAutoresizingMaskIntoConstraints = false
        mTextField.keyboardType = keyboardType
        mTextField.text = text
        mTextField.placeholder = placeHolder
        mTextField.sizeToFit()
        mTextField.layer.borderColor = UIColor.black.cgColor
        mTextField.layer.borderWidth = 0.1
        mTextField.font = UIFont().retrieveAppFont(named: font)
        mTextField.layer.cornerRadius = corner * AppLayoutGuides().proportion
        return mTextField
    }
    
    func createStackView(axis: UILayoutConstraintAxis, spacing: CGFloat, distribution: UIStackViewDistribution) -> UIStackView {
        let mStack = UIStackView()
        mStack.spacing = spacing
        mStack.axis = axis
        mStack.distribution = distribution
        mStack.translatesAutoresizingMaskIntoConstraints = false
        return mStack
    }
    
    func createButtom(title: String, titleColor: UIColor,font: AppFonts, backColor: UIColor, corner: CGFloat) -> UIButton {
        let mLoginButton = UIButton()
        mLoginButton.translatesAutoresizingMaskIntoConstraints = false
        mLoginButton.setTitle(title, for: .normal)
        mLoginButton.titleLabel?.font = UIFont().retrieveAppFont(named: font)
        mLoginButton.sizeToFit()
        mLoginButton.backgroundColor = backColor
        mLoginButton.layer.cornerRadius = corner * AppLayoutGuides().proportion
        mLoginButton.titleLabel?.textColor = titleColor
        mLoginButton.setTitleColor(titleColor, for: .normal)
        mLoginButton.titleLabel?.textAlignment = .center
        return mLoginButton
    }
    
    func createButtonWithImage(image: UIImage) -> UIButton {
    let myLayoutButton = UIButton()
    myLayoutButton.setBackgroundImage(image, for: .normal)
    myLayoutButton.translatesAutoresizingMaskIntoConstraints = false
    return myLayoutButton
    }
    
    func createSimpleLabel(text: String, textColor: UIColor, font: AppFonts) -> UILabel {
        let mLabel = UILabel()
        mLabel.text = text
        mLabel.adjustsFontSizeToFitWidth = true
        mLabel.font =  UIFont().retrieveAppFont(named: font)
        mLabel.textColor = textColor
        mLabel.sizeToFit()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        return mLabel
    }
    
    func createSearchBar(placeholder: String, color: UIColor) -> UISearchBar {
        let mSearchBar = UISearchBar()
        mSearchBar.placeholder = placeholder
        mSearchBar.barStyle = .default
        mSearchBar.barTintColor = color
        mSearchBar.returnKeyType = .done
        mSearchBar.translatesAutoresizingMaskIntoConstraints = false
        return mSearchBar
    }
    
    func createCollectionView(scrollDirection: UICollectionViewScrollDirection , backgroundColor: UIColor ) -> UICollectionView {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = scrollDirection
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let myMarvelCollectionView = UICollectionView(frame: frame, collectionViewLayout: myLayout)
        myMarvelCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myMarvelCollectionView.backgroundColor = backgroundColor
        myMarvelCollectionView.contentMode = .scaleAspectFill
        return myMarvelCollectionView
    }
    
    func createTextView(backColor: UIColor, textColor: UIColor, text: String) -> UITextView {
    let myMiddleTextView = UITextView()
    myMiddleTextView.backgroundColor = UIColor.clear
    myMiddleTextView.textColor = UIColor.white
    myMiddleTextView.isUserInteractionEnabled = false
    myMiddleTextView.translatesAutoresizingMaskIntoConstraints = false
    return myMiddleTextView
    }
    
}
