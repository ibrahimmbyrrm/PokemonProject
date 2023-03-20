//
//  APIManager.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 20.03.2023.
//

import Foundation

struct APIManager: ListAPIService{
    let requestURL = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=30")
    
    func fetchPokemons(completion : @escaping(Result<[ListPokemonResponse], FetchError>)->Void) {
        guard let requestURL = requestURL else { completion(.failure(.wrongURL)) ; return}
        let task = URLSession.shared.dataTask(with: requestURL) { data, _, error in
            guard let data = data else { completion(.failure(.fetchingError)) ; return}
            let responseData = try? JSONDecoder().decode(ListResponseData.self, from: data)
            guard let responseData = responseData else { completion(.failure(.parsingError)); return}
            completion(.success(responseData.results))
        }
        task.resume()
    }

}
enum FetchError : Error {
    case wrongURL
    case parsingError
    case fetchingError
}