//
//  PokemonCell.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 20.03.2023.
//

import UIKit
import SDWebImage

class PokemonCell: UITableViewCell {

    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIconImage: UIImageView!
    var discoverButton : DiscoverButton?
    var indexPath : IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 4
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        let borderColor: UIColor = .black
        self.layer.borderColor = borderColor.cgColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(url : String) {
        APIManager().fetchDetail(urlString: url) { pokemon in
            DispatchQueue.main.async {
                self.pokemonNameLabel.text = pokemon.name.uppercased()
                self.pokemonIconImage.sd_setImage(with: URL(string: pokemon.sprites.other.home.front_default))
            }
        }
    }
    
    @IBAction func discoverButtonClicked(_ sender: Any) {
        discoverButton?.discoverButtonClicked(indexPath: indexPath!)
    }
    
}
