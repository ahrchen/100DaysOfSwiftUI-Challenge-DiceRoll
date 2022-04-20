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
                DiceView(dices: dices.values)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(history: [Dices.exampleDices])
    }
}
