//
//  DetailView.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 21.03.2023.
//

import UIKit
import SDWebImage

class DetailView: UIViewController {

    @IBOutlet weak var abilityTableView: UITableView!
    @IBOutlet weak var pokemonDetailName: UILabel!
    @IBOutlet weak var pokemonDetailImage: UIImageView!
    
    private lazy var detailViewModel : DetailViewModelOutput = DetailViewModel()
    private lazy var abilityList = [Ability]()
    
    static var url : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfigure()
        
    }
    
    private func initialConfigure() {
        abilityTableView.delegate = self
        abilityTableView.dataSource = self
        detailViewModel.setDelegate(output: self)
        detailViewModel.createPokemonModel(url: DetailView.url!)
    }

}
extension DetailView : DetailViewOutput {
    func changeUI(name: String, abilities: [Ability], imageURL: String) {
        DispatchQueue.main.async {
            self.pokemonDetailName.text = name.uppercased()
            self.abilityList = abilities
            self.pokemonDetailImage.sd_setImage(with: URL(string: imageURL))
            self.abilityTableView.reloadData()
        }
    }
}

extension DetailView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return abilityList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = abilityList[indexPath.row].ability.name.uppercased()
        return cell
    }
}

