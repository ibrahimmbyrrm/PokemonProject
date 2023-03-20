//
//  PokemonListModel.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 20.03.2023.
//

import Foundation

struct ListResponseData : Codable {
    let count : Int
    let results : [ListPokemonResponse]
}

struct ListPokemonResponse : Codable {
    let name : String
    let url : String
}



struct LastModel {
    var name : String
    var abilities : [Ability]
    var photoURL : String
}
