//
//  PokemonListViewModel.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation

final class PokemonListViewModel : ListViewModelOutput{
    
    lazy var listService: ListAPIService = APIManager()
    var ListOutput: ListViewOutput?

    init() {
        self.listService = APIManager()
    }
    
    func fetchList() {
        listService.fetchPokemons { result in
            switch result {
            case .success(let pokemonList):
                self.ListOutput?.saveList(list: pokemonList)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setDelegate(output: ListViewOutput) {
        self.ListOutput = output
    }
    
}
