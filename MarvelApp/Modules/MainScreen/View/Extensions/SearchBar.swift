//
//  SearchBar.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 23/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension MainScreenViewController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if (searchBar.text?.count)! > 0 {
            searchActive = true
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text?.count == 0 {
            searchActive = false
        } else {
            if filteredCharacters.count > 0 {
                searchActive = true
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.resignFirstResponder()
        marvelCollectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredCharacters = specificCharacter.filter({ (text) -> Bool in
            let tmp: NSString = text.characterName! as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if filteredCharacters.isEmpty {
            filteredCharacters =  myCharacters.filter({ (text) -> Bool in
                let tmp: NSString = text.characterName! as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
        }
        if(filteredCharacters.count == 0) {
            searchActive = false
        } else {
            searchActive = true
        }
        
        if searchText.count > 2 && !loading {
            searchActive = true
            Constants.nameStartsWith = searchText
            presenter?.requestCharactersInfo(filtered: true, text: searchText)
            loading = true
        }
        self.marvelCollectionView.reloadData()
    }
}
