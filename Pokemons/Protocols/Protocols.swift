//
//  Protocols.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation
//Service Protocols
protocol GenericService {
    func fetchData<T : Codable>(url : String,type : T.Type, completion : @escaping(Result<T, HTTPError>)->Void)
}
//Pokemon List Protocols
protocol ListViewModelOutput {
    func fetchList()
    func setDelegate(output : ListViewOutput)
    
    var listService : GenericService {get}
    var ListOutput : ListViewOutput? {get}
}
protocol ListViewOutput {
    func saveList(with list : [ListPokemonResponse])
    func saveList(with error : String)
}
//Pokemon Detail Protocols
protocol DetailViewModelOutput {
    var detailView : DetailViewOutput? {get}
    var apiService : GenericService {get}
    
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


