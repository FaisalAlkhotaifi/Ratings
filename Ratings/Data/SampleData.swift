//
//  SampleData.swift
//  Ratings
//
//  Created by Faisal Alkhotaifi on 3/1/18.
//  Copyright © 2018 Faisal Alkhotaifi. All rights reserved.
//

import Foundation

final class SampleData{
    
    static func generatePlayersData() -> [Player]{
        return [
        Player(name: "Bill Evans", game: "Tic-Tac-Toe", rating: 4),
        Player(name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
        Player(name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2)
        ]
    }
}
