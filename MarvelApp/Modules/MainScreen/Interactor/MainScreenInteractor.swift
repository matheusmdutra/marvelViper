//
//  MainScreenInteractor.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 22/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation

class MainScreenInteractor {
    
    // MARK: Properties
    weak var output: MainScreenInteractorOutput?
}

extension MainScreenInteractor: MainScreenUseCase {
    func getCharacterInfo(filtered: Bool, text: String?) {
        
        MarvelDataManager().fetchCharacters(filtered: filtered, text: text, success: { (marvelData) in
            if !filtered {
                self.output?.updateView(withData: marvelData)
            }
            else {
                self.output?.updateFilter(withData: marvelData)
            }
        }) { (error) in
            self.output?.showMessage(title: "Ops", message: error!)
        }
    }
}
