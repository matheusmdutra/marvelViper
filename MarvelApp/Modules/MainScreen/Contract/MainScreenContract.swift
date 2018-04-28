//
//  MainScreenContract.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation

protocol MainScreenView: BaseView {
   
    func updateViewWithNewCharacters(withData: [MarvelData?])
    func updateFilterWithNewCharacters(withData: [MarvelData?])
    // TODO: Declare view methods
}

protocol MainScreenPresentation: class {
    func requestCharactersInfo(filtered: Bool , text: String?)
    
    // TODO: Declare presentation methods
}

protocol MainScreenUseCase: class {
    func getCharacterInfo(filtered: Bool, text: String?)
    // TODO: Declare use case methods
}

protocol MainScreenInteractorOutput: class {
    func updateView(withData: [MarvelData?])
    func updateFilter(withData: [MarvelData?])
    func showMessage(title: String, message: String)
    // TODO: Declare interactor output methods
}

protocol MainScreenWireframe: class {
    // TODO: Declare wireframe methods
}
