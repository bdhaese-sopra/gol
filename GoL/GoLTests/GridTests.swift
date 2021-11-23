//
//  GridTests.swift
//  GoLTests
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import XCTest
@testable import GoL

class GridTests: XCTestCase {

    func testWorldGeneration() throws {
        var grid = Grid(size: -1)
        XCTAssertEqual(grid.generateWorld().count, 100)

        grid = Grid(size: 10)
        XCTAssertEqual(grid.generateWorld().count, 100)

        grid = Grid(size: 20)
        XCTAssertEqual(grid.generateWorld().count, 400)
    }

    func testNeighbourhoodAlive() throws {
        var deadCell = Cell(xPos: 0, yPos: 0)
        deadCell.state = .dead

        var aliveCell = Cell(xPos: 0, yPos: 0)
        aliveCell.state = .alive

        var cells = [deadCell, deadCell, deadCell,
                     deadCell, aliveCell, deadCell,
                     deadCell, deadCell, deadCell]
        var grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 4), 0)

        // MARK: Vertical+horizontal
        cells = [deadCell, aliveCell, deadCell,
                 deadCell, aliveCell, deadCell,
                 deadCell, aliveCell, deadCell]
        grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 4), 2)

        cells = [deadCell, deadCell, deadCell,
                 aliveCell, aliveCell, aliveCell,
                 deadCell, deadCell, deadCell]
        grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 4), 2)

        // MARK: diagonal - right top/ left bottom
        cells =  [deadCell, deadCell, aliveCell,
                  deadCell, aliveCell, deadCell,
                  aliveCell, deadCell, deadCell]
        grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 4), 2)

        cells = [deadCell, deadCell, aliveCell,
                 deadCell, aliveCell, deadCell,
                 aliveCell, deadCell, deadCell]
        grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 2), 1)

        cells = [deadCell, deadCell, aliveCell,
                 deadCell, aliveCell, deadCell,
                 aliveCell, deadCell, deadCell]
        grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 6), 1)

        // MARK: diagonal left top/ right bottom
        cells =  [aliveCell, deadCell, deadCell,
                  deadCell, aliveCell, deadCell,
                  deadCell, deadCell, aliveCell]
        grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 4), 2)

        cells = [aliveCell, deadCell, deadCell,
                 deadCell, aliveCell, deadCell,
                 deadCell, deadCell, aliveCell]
        grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 0), 1)

        cells = [aliveCell, deadCell, deadCell,
                 deadCell, aliveCell, deadCell,
                 deadCell, deadCell, aliveCell]
        grid = Grid(size: 10, cells: cells)
        XCTAssertEqual(grid.neighbourhoodAlive(aliveCell, at: 8), 1)
    }
}
