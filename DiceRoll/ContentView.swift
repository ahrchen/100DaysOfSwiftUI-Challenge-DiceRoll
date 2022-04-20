//
//  ContentView.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var dices: [Dice] = Dice.exampleDices
    @State private var sides = Dice.defaultSides
    @State private var numDice = Dice.defaultNumDice
    
    var body: some View {
        HStack {
            ForEach(dices, id:\.self) { dice in
                ZStack {
                    Rectangle()
                        .fill(.blue)
                        .opacity(0.5)
                        .frame(width: 50, height: 50)
                    Text(dice.wrappedValue)
                        .font(.largeTitle)
                }
                
            }
        }
        .onTapGesture {
            rollDices()
        }
    }
    
    func rollDices() {
        dices = []
        for _ in 0..<numDice {
            dices.append(Dice(sides: sides))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
