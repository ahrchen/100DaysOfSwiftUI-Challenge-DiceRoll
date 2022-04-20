//
//  Dice.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import Foundation

struct Dices: Codable, Hashable {
    private var uuid = UUID()
    let values: [Dice]
    
    init(numDice: Int, numSides: Int) {
        var dices = [Dice]()
        for _ in 0..<numDice {
            dices.append(Dice(sides: numSides))
        }
        self.values = dices
    }
    
    static let defaultNumDice = 2
    static let exampleDices: Dices = Dices(numDice: defaultNumDice, numSides: Dice.defaultSides)
    
    static let savePath = FileManager.documentDirectory.appendingPathComponent("SavedDices")
    
    static func loadData() -> [Dices] {
        do {
            let data = try Data(contentsOf: Dices.savePath)
            let history = try JSONDecoder().decode([Dices].self, from: data)
            return history
        } catch {
            return []
        }
    }
    
    static func savaData(history: [Dices]) {
        do {
            let data = try JSONEncoder().encode(history)
            try data.write(to: Dices.savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save dices history data")
        }
    }
}

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
    static let example = Dice(sides: defaultSides)
    
    
}
