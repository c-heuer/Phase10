//
//  PlayerCell.swift
//  Phase10
//
//  Created by Christian Heuer on 20.07.17.
//  Copyright © 2017 Christian Heuer. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell, UITextFieldDelegate {

    var player : Player! {
        didSet {
            scoreLabel.text = "\(player.score())"
            phaseLabel.text = "\(player.phase())"
            nameText.text = player.name
        }
    }
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var phaseLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    
    @IBAction func updateName(_ sender: UITextField) {
        player.name = nameText.text!    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameText.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}
