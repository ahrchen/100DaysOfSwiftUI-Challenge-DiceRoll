//
//  ContentView.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var dice = Dice.example
    var body: some View {
        Text(String(dice.value))
            .onTapGesture {
                dice = Dice(value: Dice.rollDice(sides: 6))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
