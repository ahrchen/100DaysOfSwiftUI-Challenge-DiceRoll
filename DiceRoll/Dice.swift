//
//  Dice.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import Foundation

struct Dice: Codable, Hashable {
    private var uuid = UUID()
    private let value: Int
    
    public var wrappedValue: String {
        String(value)
    }
    
    init(sides: Int) {
        value = Dice.rollDice(sides: sides)
    }
    
    static func rollDice(sides: Int) -> Int {
        return Int.random(in: 1...sides)
    }
    
    static let defaultSides = 6
    static let defaultNumDice = 2
    static let example = Dice(sides: defaultSides)
    static var exampleDices: [Dice] {
        var dices = [Dice]()
        for _ in 0..<defaultNumDice {
            dices.append(Dice(sides: defaultSides))
        }
        return dices
    }
    
}
