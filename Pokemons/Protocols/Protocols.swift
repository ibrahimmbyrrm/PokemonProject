//
//  Protocols.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation
//Service Protocols
protocol ListAPIService {
    func fetchPokemons(completion : @escaping(Result<[ListPokemonResponse], FetchError>)->Void)
}
protocol DetailAPIService {
    func fetchDetail(urlString : String, completion: @escaping(PokemonModel)->Void)
}
//Pokemon List Protocols
protocol ListViewModelOutput {
    func fetchList()
    func setDelegate(output : ListViewOutput)
    
    var listService : ListAPIService {get}
    var ListOutput : ListViewOutput? {get}
}
protocol ListViewOutput {
    func saveList(list : [ListPokemonResponse])
}
//Pokemon Detail Protocols
protocol DetailViewModelOutput {
    var detailView : DetailViewOutput? {get}
    var apiService : DetailAPIService {get}
    
    func setDelegate(output : DetailViewOutput)
    func createPokemonModel(url : String)
}
protocol DetailViewOutput {
    func changeUI(name : String, abilities : [Ability], imageURL : String)
}
//Cell Button Protocol
protocol DiscoverButton {
    func discoverButtonClicked(indexPath : IndexPath)
}


