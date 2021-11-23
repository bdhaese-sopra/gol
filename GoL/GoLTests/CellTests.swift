//
//  CellTests.swift
//  GoLTests
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import XCTest
@testable import GoL

class CellTests: XCTestCase {

    func testState() throws {
        var cell = Cell(xPos: 0, yPos: 0)
        cell.state = .alive
        XCTAssertTrue(cell.state.isAlive())

        cell = Cell(xPos: 0, yPos: 0)
        cell.state = .dead
        XCTAssertFalse(cell.state.isAlive())
    }

    func testPotentialNeighbor() throws {
        let cell = Cell(xPos: 0, yPos: 0)
        let gridSize = GridSize(10)

        // Wrong index
        XCTAssertEqual(cell.getNeighbors(at: -1, for: gridSize).count, 0)
        XCTAssertEqual(cell.getNeighbors(at: 100, for: gridSize).count, 0)

        // top left and right edge
        XCTAssertEqual(cell.getNeighbors(at: 0, for: gridSize).count, 3)
        XCTAssertEqual(cell.getNeighbors(at: 9, for: gridSize).count, 3)
        // bottom left and right edge
        XCTAssertEqual(cell.getNeighbors(at: 90, for: gridSize).count, 3)
        XCTAssertEqual(cell.getNeighbors(at: 99, for: gridSize).count, 3)
        // middle bottom
        XCTAssertEqual(cell.getNeighbors(at: 95, for: gridSize).count, 5)
        // middle of somewhere
        XCTAssertEqual(cell.getNeighbors(at: 55, for: gridSize).count, 8)
    }
}
