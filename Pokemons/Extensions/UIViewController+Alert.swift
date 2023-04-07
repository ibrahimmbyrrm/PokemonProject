//
//  UIViewController+Alert.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 7.04.2023.
//

import Foundation
import UIKit
extension UIViewController {
    func callAlert(title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

