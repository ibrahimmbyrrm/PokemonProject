//
//  DetailViewModel.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelOutput{
    var apiService: DetailAPIService = APIManager()
    var detailView: DetailViewOutput?
    
    init() {
        apiService = APIManager()
    }
    
    func setDelegate(output: DetailViewOutput) {
        self.detailView = output
    }
    
    func createPokemonModel(url : String){
        apiService.fetchDetail(urlString: url) { result in
            self.detailView?.changeUI(name: result.name, abilities: result.abilities, imageURL: result.sprites.other.home.front_default)
        }

    }
    
}
