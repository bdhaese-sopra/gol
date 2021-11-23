//
//  Grid.swift
//  GoL
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import Foundation

struct Grid {
    var gridSize: GridSize
    var cells: [Cell]!

    /// Cells parameters should only use for testing purpose with an appropriate size for square root operator
    init(size: Int = Constants.Base.minimumSize, cells: [Cell] = [Cell]()) {
        self.gridSize = GridSize(size)
        defer {
            if cells.isEmpty {
                self.cells = self.generateWorld()
            } else {
                self.cells = cells
                gridSize.maxSize = cells.count
                gridSize.size = Int(sqrt(Double(cells.count)))
            }
        }
    }

    func generateWorld() -> [Cell] {
        var newCells = [Cell]()
        for y in 0..<gridSize.size {
            for x in 0..<gridSize.size {
                newCells.append(Cell(xPos: x, yPos: y))
            }
        }
        return newCells
    }

    mutating func nextGeneration() {
        for y in 0..<gridSize.size {
            for x in 0..<gridSize.size {
                let index = (y * self.gridSize.size) + x
                let cell = cells[index]
                cells[index].state = shouldBeAlive(cell, at: index) ? .alive : .dead
            }
        }
    }

    func shouldBeAlive(_ cell: Cell, at index: Int) -> Bool {
        let neighbourhoodCount = neighbourhoodAlive(cell, at: index)

        // Apply Game of life rules
        guard cell.state.isAlive() else {
            return neighbourhoodCount == 3
        }
        return (neighbourhoodCount == 2 || neighbourhoodCount == 3)
    }

    func neighbourhoodAlive(_ cell: Cell, at index: Int) -> Int {
        let neighboorIndexes = cell.getNeighbors(at: index, for: gridSize)
        var count = 0
        for neighboorIndex in neighboorIndexes where cells[neighboorIndex].state.isAlive() {
            count += 1
        }
        return count
    }
}
