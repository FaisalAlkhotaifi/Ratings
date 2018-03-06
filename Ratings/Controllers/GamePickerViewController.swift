//
//  GamePickerViewController.swift
//  Ratings
//
//  Created by Faisal Alkhotaifi on 3/3/18.
//  Copyright © 2018 Faisal Alkhotaifi. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {

    // MARK: - Properties
    var games = [
        "Angry Birds",
        "Chess",
        "Russian Roulette",
        "Spin the Bottle",
        "Texas Hold'em Poker",
        "Tic-Tac-Toe"
    ]
    
    //Unfortunately, the unwind segue method is performed before tableView(_:didSelectRowAt:), so the selectedGameIndex is not updated in time. Fortunately, you can override prepare(for:sender:) and complete the operation before the unwind happens.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveSelectedGame",
        let cell = sender as? UITableViewCell,
        let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        let index = indexPath.row
        selectedGame = games[index]
    }
    
    var selectedGameIndex: Int?
    var selectedGame: String?{
        didSet{
            if let selectedGame = selectedGame{
                let index = games.index(of: selectedGame)
                selectedGameIndex = index
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension GamePickerViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        cell.textLabel?.text = games[indexPath.row]
        
        if indexPath.row == selectedGameIndex{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //This method is called whenever the user taps a row. First deselect the row after it was tapped (makes it fade from the gray highlight color back to white). Finally, remove the checkmark from the previously selected cell, and puts it on the just tapped cell.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Other row is selected - need to deselect it
        if let index = selectedGameIndex{
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedGame = games[indexPath.row]
        
        // update the checkmark for the current row
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
}







