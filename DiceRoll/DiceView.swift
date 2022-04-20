//
//  DiceView.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import SwiftUI

struct DiceView: View {
    let dices: [Dice]
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
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(dices: Dices.exampleDices.values)
    }
}
