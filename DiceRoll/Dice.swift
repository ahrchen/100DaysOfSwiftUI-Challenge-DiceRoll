//
//  Dice.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import Foundation

struct Dice: Codable {
    let value: Int
    
    static func rollDice(sides: Int) -> Int {
        return Int.random(in: 1...sides)
    }
    static let example = Dice(value: 6)
}
