//
//  ViewController.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 20.03.2023.
//

import UIKit

class ListView: UIViewController, ListViewOutput {
    func saveList(list: [ListPokemonResponse]) {
        self.pokelist = list
        DispatchQueue.main.async {
            self.pokemonTableView.reloadData()
        }
    }
    var pokelist = [ListPokemonResponse]()
    lazy var listViewModel : ListViewModelOutput = PokemonListViewModel()
    @IBOutlet weak var pokemonTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listViewModel.fetchList()
        listViewModel.setDelegate(output: self)
        initialConfigure()
    }
    
    private func initialConfigure() {
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
    }


}
extension ListView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !pokelist.isEmpty {
            return pokelist.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PokemonCell
        cell.updateUI(poke: pokelist[indexPath.row], index: indexPath)
        return cell
    }
    
    
}

