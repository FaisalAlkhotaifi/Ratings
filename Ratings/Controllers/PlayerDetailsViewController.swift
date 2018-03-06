//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Faisal Alkhotaifi on 3/3/18.
//  Copyright © 2018 Faisal Alkhotaifi. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    // MARK: - Properties
    var player: Player?
    
    var game: String? {
        didSet{
            detailLabel.text = game
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail"{
            if let playerName = nameTextField.text{
                player = Player(name: playerName, game: game, rating: 1)
            }
        } else if segue.identifier == "PickGame",
            let gamePickerViewController = segue.destination as? GamePickerViewController{
            gamePickerViewController.selectedGame = game
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension PlayerDetailsViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let a tap anywhere inside the row bring up the keyboard
        if indexPath.section == 0{
            nameTextField.becomeFirstResponder()
        }
    }
}

// MARK: - IBActions
extension PlayerDetailsViewController{
    @IBAction func unwindWithSelectedGame(_ segue: UIStoryboardSegue){
        if let gamePickerViewController = segue.source as? GamePickerViewController,
            let selectedGame = gamePickerViewController.selectedGame{
                game = selectedGame
        }
    }
}














