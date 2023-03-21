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
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonAbilities.delegate = self
        pokemonAbilities.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print(DetailView.url!)
        updateUI(url: DetailView.url!)
    }
    
    func updateUI(url : String) {
        APIManager().fetchDetail(urlString: url) { pokemon in
            DispatchQueue.main.async {
                self.pokemonDetailName.text = pokemon.name
                self.pokemonDetailImage.sd_setImage(with: URL(string: pokemon.sprites.other.home.front_default))
                self.abilityList = pokemon.abilities
            }
          
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

