//
//  Cell.swift
//  GoL
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import Foundation

enum CellState {
    case alive
    case dead

    func isAlive() -> Bool {
        return false
    }
}

struct Cell {
    let xPos: Int
    let yPos: Int
    var state: CellState

    init(xPos: Int, yPos:Int) {
        self.xPos = xPos
        self.yPos = yPos
        self.state = .dead
    }


    func potentialNeighbor(at index: Int, for size: GridSize) -> [Int] {
        return [Int]()
    }
}
