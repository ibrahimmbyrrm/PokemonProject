//
//  NetoworkHelper.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 7.04.2023.
//

import Foundation

enum HTTPError : String, Error {
    case invalidURL = "Invalid URL"
    case invalidData = "Invalid DATA"
    case parsingError = "Parsing Error"
}
class BaseURLS {
    static let shared = BaseURLS()
    
    let listURL = "https://pokeapi.co/api/v2/pokemon?limit=30"
}
