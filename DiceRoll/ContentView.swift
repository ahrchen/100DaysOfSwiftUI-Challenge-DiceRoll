//
//  ContentView.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//
// TODO: ADD animation to dice

import SwiftUI

struct ContentView: View {
    @State private var history: [Dices]
    @State private var dices: Dices = Dices.exampleDices
    @State private var numSides = Dice.defaultSides
    @State private var numDice = Dices.defaultNumDice
    @State private var isShowingHistory = false
    @State private var feedback = UINotificationFeedbackGenerator()
    let maxDice = 5
    let minDice = 1
    let possibleSides = [4, 6, 8, 10, 12, 20, 100]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Stepper("\(numDice) Dice", onIncrement: {
                        if numDice < maxDice {
                            numDice += 1
                        }
                    }, onDecrement: {
                        if numDice > minDice {
                            numDice -= 1
                        }
                    })
                    .onChange(of: numDice) { _ in
                        updateDices()
                    }
                    Picker("Number of sides", selection: $numSides){
                        ForEach(possibleSides, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: numSides) { _ in
                        updateDices()
                    }
                }
                DiceView(dices: dices.values)
                    .onHover { _ in
                        feedback.prepare()
                    }
                    .onTapGesture {
                        feedback.notificationOccurred(.success)
                        updateDices()
                    }
                    .accessibilityAddTraits(.isButton)
            }
            .sheet(isPresented: $isShowingHistory) {
                HistoryView(history: history)
            }
            .navigationBarTitle("Roll Dice")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("History") {
                        isShowingHistory.toggle()
                    }
                
                }
            }
        }
    
    }
    
    init() {
        _history = State(wrappedValue: Dices.loadData())
    }
    
    func updateDices() {
        history.append(dices)
        saveData()
        dices = Dices(numDice: numDice, numSides: numSides)
    }
    
    func loadData() {
        history = Dices.loadData()
    }
    
    func saveData() {
        Dices.savaData(history: history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
