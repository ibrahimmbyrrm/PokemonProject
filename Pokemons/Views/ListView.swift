//
//  ViewController.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 20.03.2023.
//

import UIKit

class ListView: UIViewController, ListViewOutput {

    @IBOutlet weak var pokemonTableView: UITableView!
    
    private lazy var pokelist = [ListPokemonResponse]()
    lazy var listViewModel : ListViewModelOutput = PokemonListViewModel()
    lazy var selectedURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfigure()
    }
    func saveList(with error: String) {
        self.callAlert(title: "ERROR", message: error)
    }
    
    func saveList(with list: [ListPokemonResponse]) {
        self.pokelist = list
        pokemonTableView.reloadOnMainThread()
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
        self.selectedURL = pokelist[indexPath.row].url
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destVC = segue.destination as! DetailView
            destVC.selectedURL = self.selectedURL
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



