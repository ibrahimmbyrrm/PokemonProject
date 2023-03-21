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
    
    var transferURL : String?
    private lazy var pokelist = [ListPokemonResponse]()
    lazy var listViewModel : ListViewModelOutput = PokemonListViewModel()
    @IBOutlet weak var pokemonTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfigure()
    }
    
    private func initialConfigure() {
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        listViewModel.fetchList()
        listViewModel.setDelegate(output: self)
    }

}
extension ListView : UITableViewDelegate, UITableViewDataSource, DiscoverButton {
    func discoverButtonClicked(indexPath: IndexPath) {
        DetailView.url = pokelist[indexPath.row].url
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pokelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PokemonCell
        cell.updateUI(url: pokelist[indexPath.row].url)
        cell.discoverButton = self
        cell.indexPath = indexPath
        return cell
    }
   
}

