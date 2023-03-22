//
//  AbilityCell.swift
//  Pokemons
//
//  Created by İbrahim Bayram on 22.03.2023.
//

import UIKit

class AbilityCell: UITableViewCell {

    @IBOutlet weak var abilityNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
        
    }
    
    func setupView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        let borderColor: UIColor = .orange
        self.layer.borderColor = borderColor.cgColor
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
