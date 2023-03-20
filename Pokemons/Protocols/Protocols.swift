//
//  Protocols.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation

protocol ListAPIService {
    func fetchPokemons(completion : @escaping(Result<[ListPokemonResponse], FetchError>)->Void)
}

protocol ListViewModelOutput {
    func fetchList()
    
    var listService : ListAPIService {get}
    var pokemonList : [ListPokemonResponse] {get set}
    var ListOutput : ListViewOutput? {get}
   
    func setDelegate(output : ListViewOutput)
}
protocol ListViewOutput {
    func saveList(list : [ListPokemonResponse])
}
