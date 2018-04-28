//
//  MainScreenRouter.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class MainScreenRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> MainScreenViewController {
        let viewController = UIStoryboard.loadViewController() as MainScreenViewController
        let presenter = MainScreenPresenter()
        let router = MainScreenRouter()
        let interactor = MainScreenInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController as! MainScreenView
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension MainScreenRouter: MainScreenWireframe {
    // TODO: Implement wireframe methods
}
