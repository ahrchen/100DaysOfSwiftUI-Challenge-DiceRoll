//
//  FileManager-DocumentDirectory.swift
//  DiceRoll
//
//  Created by Raymond Chen on 4/20/22.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
