//
//  GoLTests.swift
//  GoLTests
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import XCTest
@testable import GoL

class CellTests: XCTestCase {

    func testState() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var cell = Cell(xPos: 0, yPos: 0)
        cell.state = .alive
        XCTAssertTrue(cell.state.isAlive())
    }

    func testPotentialNeighbor() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cell = Cell(xPos: 0, yPos: 0)
        let gridSize = GridSize(10)

        //top left and right edge
        XCTAssertEqual(cell.potentialNeighbor(at: 0, for: gridSize).count, 3)
        XCTAssertEqual(cell.potentialNeighbor(at: 9, for: gridSize).count, 3)
        //bottom left and right edge
        XCTAssertEqual(cell.potentialNeighbor(at: 90, for: gridSize).count, 3)
        XCTAssertEqual(cell.potentialNeighbor(at: 99, for: gridSize).count, 3)
        //middle bottom
        XCTAssertEqual(cell.potentialNeighbor(at: 95, for: gridSize).count, 6)
        //middle of somewhere
        XCTAssertEqual(cell.potentialNeighbor(at: 55, for: gridSize).count, 8)
    }
}