//
//  HistoryView.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import SwiftUI

struct HistoryView: View {
    let history: [Dices]
    var body: some View {
        List {
            ForEach(history.reversed(), id: \.self) { dices in
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
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(history: [Dices.exampleDices])
    }
}
