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
    @IBOutlet weak var discoverButtonView: UIButton!
    var discoverButton : DiscoverButton?
    var indexPath : IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 10
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        let borderColorBlue: UIColor = .systemBlue
        let borderColorBlack : UIColor = .black
        self.layer.borderColor = borderColorBlue.cgColor
        self.selectionStyle = .none
        self.pokemonIconImage.layer.masksToBounds = false
        self.pokemonIconImage.layer.borderWidth = 3
        self.pokemonIconImage.layer.cornerRadius = pokemonIconImage.frame.size.width / 2
        self.pokemonIconImage.layer.borderColor = borderColorBlack.cgColor
        self.pokemonIconImage.clipsToBounds = true
        discoverButtonView.layer.cornerRadius = 10
        
    }
    
    func updateUI(url : String) {
        NetworkManager().fetchData(url: url, type: PokemonModel.self) { response in
            switch response {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self.pokemonIconImage.sd_setImage(with: URL(string:pokemon.sprites.other.home.front_default))
                    self.pokemonNameLabel.text = pokemon.name.uppercased()
                }
            case.failure(let error):
                print(error.rawValue)
            }
        }
        
    }
    
    @IBAction func discoverButtonClicked(_ sender: Any) {
        discoverButton?.discoverButtonClicked(indexPath: indexPath!)
    }
    
}
