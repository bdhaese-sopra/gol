//
//  CellUtils.swift
//  GoL
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import Foundation

struct CellUtils {
    static func randomState() -> CellState {
        return Int.random(in: 1...2)%2 == 0 ? .alive : .dead
    }
}
