//
//  Player.swift
//  Phase10
//
//  Created by Christian Heuer on 20.07.17.
//  Copyright © 2017 Christian Heuer. All rights reserved.
//

import UIKit

class Player: NSObject {

    var name = "New Player"
    var rounds : [RoundResult] = []
    
    func score() -> Int {
        return rounds.reduce( 0, { $0 + $1.score })
    }
    
    func phase() -> Int {
        return rounds.filter({ $0.roundCompleted }).count + 1
    }
}
