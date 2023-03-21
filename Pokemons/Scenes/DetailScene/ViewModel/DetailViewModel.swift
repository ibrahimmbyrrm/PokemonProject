//
//  DetailViewModel.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation

class DetailViewModel{
    var pokemonViewModel : PokemonViewModel?
    
    func createPokemonModel(url : String){
        APIManager().fetchDetail(urlString: url) { result in
            self.pokemonViewModel = PokemonViewModel(pokemon: result)
        }
    }
    
}

struct PokemonViewModel {
    var pokemon : PokemonModel
    
    var name : String {
        return pokemon.name
    }
    var photoURL : URL {
        return URL(string: pokemon.sprites.other.home.front_default)!
    }
    var abilities : [Ability] {
        return pokemon.abilities
    }
}
