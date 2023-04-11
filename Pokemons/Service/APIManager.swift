//
//  APIManager.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 20.03.2023.
//

import Foundation

struct NetworkManager : GenericService{
    
    func fetchData<T : Codable>(url : String ,type : T.Type, completion : @escaping(Result<T, HTTPError>)->Void) {
        guard let url = url.asUrl else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            self.responseHandler(data: data) { response in
                completion(response)
            }
            
        }.resume()
    }
    
    func responseHandler<T : Codable>(data : Data, completion : @escaping(Result<T, HTTPError>)->Void) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        }catch {
            completion(.failure(.parsingError))
        }
    }
}

