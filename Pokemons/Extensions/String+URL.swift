//
//  String+URL.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 12.04.2023.
//

import Foundation

extension String {
    var asUrl : URL? {
        return URL(string: self)
    }
}
