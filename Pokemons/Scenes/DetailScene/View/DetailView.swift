//
//  DetailView.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import UIKit
import SDWebImage

class DetailView: UIViewController {

    @IBOutlet weak var pokemonAbilities: UITableView!
    @IBOutlet weak var pokemonDetailName: UILabel!
    @IBOutlet weak var pokemonDetailImage: UIImageView!
    
    static var url : String?
    var abilityList = [Ability]() {
        didSet{
            self.pokemonAbilities.reloadData()
        }
    }
    var detailViewModel = DetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonAbilities.delegate = self
        pokemonAbilities.dataSource = self
        updateUI(url: DetailView.url!)
        
    }

    func updateUI(url : String) {
        detailViewModel.createPokemonModel(url: url)
        DispatchQueue.main.async {
            self.pokemonDetailName.text = self.detailViewModel.pokemonViewModel?.name.uppercased()
            self.pokemonDetailImage.sd_setImage(with: self.detailViewModel.pokemonViewModel?.photoURL)
            self.abilityList = self.detailViewModel.pokemonViewModel!.abilities
        }
    }
    
}
extension DetailView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !abilityList.isEmpty {
            return abilityList.count
        }else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = abilityList[indexPath.row].ability.name
        return cell
    }
}

