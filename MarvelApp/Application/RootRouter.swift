//
//  RootRouter.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class RootRouter: NSObject {
    
    func presentFirstScreen() {
        presentView()
    }
    
    private func presentView() {
        guard let window = UIApplication.shared.delegate?.window! else { return }
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
       let firstViewController = MainScreenRouter.setupModule()

        window.rootViewController = firstViewController
    }
    
}
