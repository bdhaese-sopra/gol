//
//  Grid.swift
//  GoL
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import Foundation

struct Grid {
    let gridSize: GridSize
    var cells: [Cell]

    init(size: Int = 10, cells: [Cell] = [Cell]()) {
        self.gridSize = GridSize(size)
        self.cells = cells
        defer {
            self.cells = self.generateWorld()
        }
    }

    func generateWorld() -> [Cell] {
        return []
    }

    func nextGeneration() {
    }

    func neighbourhoodAlive(_ cell: Cell, at index: Int) -> Int {
        return 0
    }
}
