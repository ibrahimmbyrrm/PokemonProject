//
//  PokemonListViewModel.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import Foundation
import UIKit

final class PokemonListViewModel : ListViewModelOutput{
    
    lazy var listService: GenericService = NetworkManager()
    var ListOutput: ListViewOutput?

    func fetchList() {
        listService.fetchData(url: BaseURLS.shared.listURL, type: ListResponseData.self) { response in
            switch response {
            case .success(let list):
                self.ListOutput?.saveList(with: list.results)
            case .failure(let error):
                self.ListOutput?.saveList(with: error.rawValue)
            }
        }
    }
    
    func setDelegate(output: ListViewOutput) {
        self.ListOutput = output
    }

    
}
