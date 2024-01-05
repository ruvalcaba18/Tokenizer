//
//  TokenizenModel.swift
//  TokenizedSwiftApp
//
//  Created by Jael on 04/01/2024.
//

import Foundation
class TokenizenModel {
    var languageDict: [String: [String]] = [:]
    
    init() {
        languageDict["en"] = ["if", "and"]
        languageDict["es"] = ["si", "y"]
        languageDict["ru"] = ["если", "и"]
        languageDict["uk"] = ["якщо", "і"]
    }

    func tokenizeText(_ text: String, forLanguage language: String) -> [String] {
        
        guard let separators = languageDict[language] else {
            return []
        }
        
        let lowercasedText = text.lowercased()
        var result: [String] = []
        var currentToken = ""

        for char in lowercasedText {
            
            let currentChar = String(char)
            
            if separators.contains(where: { currentToken.lowercased().hasSuffix($0.lowercased()) }) {
                
                result.append(currentToken)
                currentToken = currentChar
                
            } else {
                currentToken += currentChar
            }
        }

        result.append(currentToken)

        let filteredResult = result.filter { !$0.isEmpty }

        return filteredResult
    }
    

}

