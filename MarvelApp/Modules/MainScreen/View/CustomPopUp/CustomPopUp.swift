//
//  CustomPopUp.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 11/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class CustomPopUp {

    var view : UIView
    var popUpTopImageView = ComplexComponents().createCustomImageViewWith(image: nil, contentMode: .scaleAspectFill, backgroundColor: .darkGray, cornerRadius: 10, maskedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
    
    var popUpmiddleView = ComplexComponents().createViewWith(backgroundColor: .myRedColor, borderWidht: 1, borderColor: .darkGray, cornerRadius: nil, maskedCorners: nil)
    
    var popUpmiddleTextView = GlobalComponents().createTextView(backColor: .clear, textColor: .white, text: "")
    
    var popUpbottomView = ComplexComponents().createViewWith(backgroundColor: .myRedColor, borderWidht: nil, borderColor: nil, cornerRadius: 10, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
    
    var popUpEntireView = ComplexComponents().createViewWith(backgroundColor: .darkGray, borderWidht: 1, borderColor: .black, cornerRadius: 10, maskedCorners: nil)
    
    var popUpbackButton = GlobalComponents().createButtom(title: "Back", titleColor: .white, font: .normal, backColor: .clear, corner: 0)
    
    var popUpsiteButton = GlobalComponents().createButtom(title: "More Info", titleColor: .white, font: .normal, backColor: .clear, corner: 0)
    
    var popUpSepareteView = GlobalComponents().createViewWith(backgroundColor: .darkGray)
    
    
    init(view: UIView, text: NSAttributedString, image: UIImage?, source: MainScreenViewController) {
        self.view = view
        popUpbackButton.addTarget(self, action: #selector(source.dismissPopUp), for: .touchUpInside)
        popUpsiteButton.addTarget(self, action: #selector(source.goToWebSite), for: .touchUpInside)
        popUpmiddleTextView.attributedText = text
        if let img = image {popUpTopImageView.image = img}

    }
    
    func popUpView() -> UIView {

        view.addSubview(popUpEntireView)
        
        [popUpTopImageView,popUpmiddleView,popUpbottomView].forEach{popUpEntireView.addSubview($0)}
        
        [popUpmiddleTextView].forEach{popUpmiddleView.addSubview($0)}

        [popUpSepareteView,popUpbackButton,popUpsiteButton].forEach{popUpbottomView.addSubview($0)}

        NSLayoutConstraint.activate([
            
            // PopUp Constrain
            popUpEntireView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            popUpEntireView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            popUpEntireView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popUpEntireView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // TopView Constrain
            popUpTopImageView.topAnchor.constraint(equalTo: popUpEntireView.topAnchor),
            popUpTopImageView.trailingAnchor.constraint(equalTo: popUpEntireView.trailingAnchor),
            popUpTopImageView.leadingAnchor.constraint(equalTo: popUpEntireView.leadingAnchor),
            popUpTopImageView.heightAnchor.constraint(equalTo: popUpEntireView.heightAnchor, multiplier: 0.35),
            
            // MiddleView Constrain
            popUpmiddleView.topAnchor.constraint(equalTo: popUpTopImageView.bottomAnchor),
            popUpmiddleView.trailingAnchor.constraint(equalTo: popUpEntireView.trailingAnchor),
            popUpmiddleView.leadingAnchor.constraint(equalTo: popUpEntireView.leadingAnchor),
            popUpmiddleView.heightAnchor.constraint(equalTo: popUpEntireView.heightAnchor, multiplier: 0.55),
            
            // PopUpMiddleTextView
            popUpmiddleTextView.topAnchor.constraint(equalTo: popUpmiddleView.topAnchor, constant: 10),
            popUpmiddleTextView.trailingAnchor.constraint(equalTo: popUpEntireView.trailingAnchor, constant: -5),
            popUpmiddleTextView.leadingAnchor.constraint(equalTo: popUpEntireView.leadingAnchor, constant: 5),
            popUpmiddleTextView.bottomAnchor.constraint(equalTo: popUpmiddleView.bottomAnchor, constant: 10),
            
            // BottomView Constrain
            popUpbottomView.topAnchor.constraint(equalTo: popUpmiddleView.bottomAnchor),
            popUpbottomView.trailingAnchor.constraint(equalTo: popUpEntireView.trailingAnchor),
            popUpbottomView.leadingAnchor.constraint(equalTo: popUpEntireView.leadingAnchor),
            popUpbottomView.heightAnchor.constraint(equalTo: popUpEntireView.heightAnchor, multiplier: 0.10),
            
            // Adding Separeter View
            popUpSepareteView.topAnchor.constraint(equalTo: popUpmiddleView.bottomAnchor),
            popUpSepareteView.centerXAnchor.constraint(equalTo: popUpbottomView.centerXAnchor),
            popUpSepareteView.bottomAnchor.constraint(equalTo: popUpbottomView.bottomAnchor),
            popUpSepareteView.widthAnchor.constraint(equalToConstant: 1),
            
            // Adding Two Buttons
            popUpbackButton.centerYAnchor.constraint(equalTo: popUpbottomView.centerYAnchor),
            popUpbackButton.trailingAnchor.constraint(equalTo: popUpSepareteView.leadingAnchor, constant: -10),
            popUpbackButton.leadingAnchor.constraint(equalTo: popUpbottomView.leadingAnchor, constant: 10),
            
            popUpsiteButton.centerYAnchor.constraint(equalTo: popUpbottomView.centerYAnchor),
            popUpsiteButton.trailingAnchor.constraint(equalTo: popUpbottomView.trailingAnchor, constant: -10),
            popUpsiteButton.leadingAnchor.constraint(equalTo: popUpSepareteView.trailingAnchor, constant: 10),
            
            ])
        return popUpEntireView
    }
}


