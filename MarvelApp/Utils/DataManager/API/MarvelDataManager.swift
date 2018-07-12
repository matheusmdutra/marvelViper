//
//  MarvelDataManager.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 18/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import Alamofire

class MarvelDataManager {
    
    func fetchCharacters(filtered: Bool, text: String? , success: @escaping (_ characters: [MarvelData?]) -> Void  , failure: ((_ error: String?) -> Void)?) {
        let url = Constants.marvelURL + Constants.characters
        var params = [String:Any]()
        
        if filtered {
            params = filterParams
            params["nameStartsWith"] = text
        } else {
            params = normalParams
        }
        
        Alamofire.request(url, parameters: params).responseJSON { response in
            
            
            self.responseAPI(url, response.response?.statusCode, response.data!, success: {
                var allCharacters = [MarvelData]()
                do {
                    let marvelCharacters = try JSONDecoder().decode(APIResponse.self, from: response.data!)
                    marvelCharacters.data?.results?.forEach { marvelResponse in
                        let newCharacters = self.transformApiData(data: marvelResponse)
                        allCharacters.append(newCharacters!)
                    }
                    success(allCharacters)
                } catch let jsonErr {
                    failure!(String(describing: jsonErr)
                    )}
                
            }, failure: {(error) in
                failure!(error)
            })
        }
    }
    
    // Local Functions
    
    func transformApiData(data: CharactersInfo) -> MarvelData? {
        
        let url = URL(string: data.thumbnail.map {$0.path}!! + ".jpg")
        let descriptionUrl = data.urls?.first?.url
        let newCharacter = MarvelData(name: data.name, url: url, description: data.description, urlDescription: descriptionUrl)
    
        return newCharacter

    }
    
    let normalParams  = [
        "apikey": Constants.publicKey,
        "ts": Constants.ts,
        "hash": Constants.hash,
        "limit" : Constants.limitPerRequest,
        "offset" : Constants.offSet,
        ] as [String : Any]
    
    
    let filterParams  = [
        "nameStartsWith": "" ,
        "apikey": Constants.publicKey,
        "ts": Constants.ts,
        "hash": Constants.hash,
        "limit" : Constants.limitPerRequest,
        //        "offset" : Constants.offSet,
        ] as [String : Any]
    
    
    
    // My Global Functions
    
    func responseAPI(_ url: String, _ statusCode: Int?, _ data: Data, success: (() -> Void)?, failure:  ((_ error: String) -> Void)?){
        var logger = "URL: \(url) - code: \(statusCode ?? 0) "
        if statusCode != 200 {  logger += self.loggerError(data:data)}
        guard let statusCode = statusCode else {
            failure!(self.showError(data: data))
            return
        }
        switch statusCode {
        case 200..<400:
            success!()
            return
        default:
            failure!(self.showError(data: data))
            return
        }
    }
    func loggerError(data: Data) -> String{
        let errorString = "Ocorreu um erro ao executar essa ação no servidor."
        if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
            return "\(json)"
        }
        return errorString
    }
    
    func showError(data: Data) -> String{
        var errorString = "Ocorreu um erro ao executar essa ação no servidor."
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any] {
            if let errors: [[String: Any]] = json["errors"] as? [[String: Any]]{
                errorString = errors[0]["message"]! as! String
            }
        }
        return errorString
    }
}

