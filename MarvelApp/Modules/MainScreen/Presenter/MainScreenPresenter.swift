//
//  MainScreenPresenter.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation

class MainScreenPresenter {
    
    // MARK: Properties
    weak var view: MainScreenView?
    var router: MainScreenWireframe?
    var interactor: MainScreenUseCase?
}

extension MainScreenPresenter: MainScreenPresentation {
    func requestCharactersInfo(filtered: Bool, text: String?) {
        view?.showLoading()
        interactor?.getCharacterInfo(filtered: filtered, text: text)
    }
}

extension MainScreenPresenter: MainScreenInteractorOutput {
    func updateFilter(withData: [MarvelData?]) {
        view?.updateFilterWithNewCharacters(withData: withData)
    }
    
    func updateView(withData: [MarvelData?]) {
        view?.updateViewWithNewCharacters(withData: withData)
    }
    
    func showMessage(title: String, message: String) {
        view?.hideLoading()
        view?.showMessage(message, withTitle: title)
    }
}
