//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.presentInitialScreen()
        UIApplication.shared.statusBarStyle = .default
        return true
    }
    
    // MARK: Private Methods
    
    func presentInitialScreen() {
        let rootRouter = RootRouter()
        rootRouter.presentFirstScreen()
    }
    
}



