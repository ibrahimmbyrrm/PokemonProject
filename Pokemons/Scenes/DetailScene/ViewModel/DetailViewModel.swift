//
//  DetailViewModel.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelOutput{
    var detailView: DetailViewOutput?
    
    func setDelegate(output: DetailViewOutput) {
        self.detailView = output
    }
    
    var pokemonViewModel : PokemonViewModel?
    
    func createPokemonModel(url : String){
        APIManager().fetchDetail(urlString: url) { result in
            self.detailView?.changeUI(name: result.name, abilities: result.abilities, imageURL: result.sprites.other.home.front_default)
        }
    }
    
}
