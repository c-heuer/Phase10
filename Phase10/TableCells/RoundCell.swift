//
//  RoundCell.swift
//  Phase10
//
//  Created by Christian Heuer on 20.07.17.
//  Copyright © 2017 Christian Heuer. All rights reserved.
//

import UIKit

class RoundCell: UITableViewCell {

    var round : RoundResult! {
        didSet {
            roundCompleteSwitch.isOn = round.roundCompleted
            scoreLabel.text = "\(round.score)"
            stepper.value = Double(round.score)
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roundCompleteSwitch: UISwitch!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperChanged(_ sender: UIStepper, forEvent event: UIEvent) {
        round.score = Int(sender.value)
        scoreLabel.text = "\(round.score)"
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        round.roundCompleted = sender.isOn
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
