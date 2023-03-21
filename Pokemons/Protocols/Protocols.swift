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
protocol DetailAPIService {
    func fetchDetail(urlString : String, completion: @escaping(PokemonModel)->Void)
}

protocol ListViewModelOutput {
    func fetchList()
    
    var listService : ListAPIService {get}
    var ListOutput : ListViewOutput? {get}
   
    func setDelegate(output : ListViewOutput)
}
protocol ListViewOutput {
    func saveList(list : [ListPokemonResponse])
}

protocol DetailViewModelOutput {
    var detailView : DetailViewOutput? {get}
    var apiService : DetailAPIService {get}
    func setDelegate(output : DetailViewOutput)
    func createPokemonModel(url : String)
}
protocol DetailViewOutput {
    func changeUI(name : String, abilities : [Ability], imageURL : String)
}

protocol DiscoverButton {
    func discoverButtonClicked(indexPath : IndexPath)
}


