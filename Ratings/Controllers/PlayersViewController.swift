//
//  FirstViewController.swift
//  Ratings
//
//  Created by Faisal Alkhotaifi on 3/1/18.
//  Copyright © 2018 Faisal Alkhotaifi. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {

    //MARK: Properties
    var players = SampleData.generatePlayersData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerCell else {
            fatalError("The dequeued cell is not an instance of PlayerCell.")
        }
        
        let player = players[indexPath.row]
        cell.player = player
        
        return cell
    }

}

extension PlayersViewController{
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue){
        print("You pressed cancel button.")
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue){
        guard let playerDetailsViewController = segue.source as? PlayerDetailsViewController, let player = playerDetailsViewController.player else {
            return
        }
        
        players.append(player)
        
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

















