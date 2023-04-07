//
//  DetailViewModel.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation

class DetailViewModel: DetailViewModelOutput{
    var apiService: GenericService = NetworkManager()
    var detailView: DetailViewOutput?

    func setDelegate(output: DetailViewOutput) {
        self.detailView = output
    }
    
    func createPokemonModel(url : String){
        apiService.fetchData(url: url, type: PokemonModel.self) { response in
            switch response {
            case .success(let pokemonModel):
                self.detailView?.changeUI(name: pokemonModel.name, abilities: pokemonModel.abilities, imageURL: pokemonModel.sprites.other.home.front_default)
            case.failure(let error):
                print(error.rawValue)
            }
        }

    }
    
}
