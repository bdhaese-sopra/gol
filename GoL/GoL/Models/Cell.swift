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
        return self == .alive
    }
}

struct Cell {
    let xPos: Int
    let yPos: Int
    var state: CellState

    init(xPos: Int, yPos: Int) {
        self.xPos = xPos
        self.yPos = yPos
        self.state = CellUtils.randomState()
    }

    /**
     This function will return an array of index representing the potential neighbor for a given index and a given size

     ```
     Neighboor position
     ### index-(size+1) ### - ### index-size ### - ### index-(size-1) ###
     ### index-1        ######### CELL  ########   ### index+1 ###
     ### index+(size-1) ### - ### index+size ### - ### index(size+1)  ###
     ```
     */
    func getNeighbors(at index: Int, for gridSize: GridSize) -> [Int] {
        let maxSize = gridSize.maxSize

        guard index >= 0 && index < gridSize.maxSize else {
            return []
        }

        // ex: grid size 10x10 and index 10%10 will give us true
        let isLeftEdge = index % gridSize.size == 0
        // ex: grid size 10x10 and index 99+1%10 will give us true
        let isRightEdge = (index + 1) % gridSize.size == 0
        let upper = index-gridSize.size
        let downstair = index + gridSize.size

        let potentialNeighbors = [isRightEdge ? -1: upper+1,
                                  upper,
                                  isLeftEdge ? -1 : upper-1,
                                  isLeftEdge ? -1 : index-1,
                                  isRightEdge ? -1 : index+1,
                                  isLeftEdge ? -1 : downstair-1,
                                  downstair,
                                  isRightEdge ? -1: downstair+1
        ].filter({$0 >= 0 && $0 < maxSize})
        return potentialNeighbors
    }
}
