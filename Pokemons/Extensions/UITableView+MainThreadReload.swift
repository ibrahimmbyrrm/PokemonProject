//
//  UITableView+MainThreadReload.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 25.03.2023.
//

import Foundation
import UIKit

extension UITableView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
