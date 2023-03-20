//
//  PokemonModel.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 20.03.2023.
//

import Foundation

struct PokemonModel : Codable {
    let abilities : [Ability]
    let name : String
    let sprites : Sprite
}

//Ability Structs

struct Ability : Codable {
    let ability : AbilityDetails
}
struct AbilityDetails : Codable {
    let name : String
    let url : String
}

//Photo Structs

struct Sprite : Codable {
    let front_default : String
    let other : OtherPhotos
}

struct OtherPhotos : Codable {
    let home : DreamWorld
}
struct DreamWorld : Codable {
    let front_default : String
}

