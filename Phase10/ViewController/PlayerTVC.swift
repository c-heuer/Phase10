//
//  PlayerTVC.swift
//  Phase10
//
//  Created by Christian Heuer on 20.07.17.
//  Copyright © 2017 Christian Heuer. All rights reserved.
//

import UIKit

class PlayerTVC: UITableViewController {

    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let player = Player()
        game.players.append(player)

    }

    @IBAction func saveToMainViewController(segue: UIStoryboardSegue) {
        let roundTVC = segue.source as! RoundTVC
        
        game.players = roundTVC.players
        
        self.tableView.reloadData()
    }

    @IBAction func addPlayer(_ sender: Any) {
        let player = Player()
        game.players.append(player)
        
        tableView.reloadData()
    }
    
    @IBAction func clearRounds(_ sender: Any) {
        for player in game.players {
            player.rounds.removeAll()
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return game.players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell

        let player = game.players[indexPath.row]
        // Configure the cell...

        cell.player = player
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? RoundTVC {
            target.players = game.players
        }
    }

}
