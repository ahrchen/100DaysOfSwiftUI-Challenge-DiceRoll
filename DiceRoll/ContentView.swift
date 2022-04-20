//
//  ContentView.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var dices: Dices = Dices.exampleDices
    @State private var numSides = Dice.defaultSides
    @State private var numDice = Dices.defaultNumDice
    
    let maxDice = 5
    let minDice = 1
    let possibleSides = [4, 6, 8, 10, 12, 20, 100]
    
    var body: some View {
        VStack {
            Form {
                Stepper("\(numDice) Dice", onIncrement: {
                    if numDice < maxDice {
                        numDice += 1
                        updateDices()
                    }
                }, onDecrement: {
                    if numDice > minDice {
                        numDice -= 1
                        updateDices()
                    }
                })
                Picker("Number of sides", selection: $numSides){
                    ForEach(possibleSides, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            HStack {
                ForEach(dices.values, id:\.self) { dice in
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
                updateDices()
            }
            .accessibilityAddTraits(.isButton)
        }
    
    }
    
    func updateDices() {
        dices = Dices(numDice: numDice, numSides: numSides)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
