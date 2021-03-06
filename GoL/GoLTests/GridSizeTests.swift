//
//  GridSizeTests.swift
//  GoLTests
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import XCTest
@testable import GoL

class GridSizeTests: XCTestCase {

    func testSize() throws {
        var grid = GridSize(-1)
        XCTAssertEqual(grid.size, 10)

        grid = GridSize(9)
        XCTAssertEqual(grid.size, 10)

        grid = GridSize(20)
        XCTAssertEqual(grid.size, 20)
    }

    func testMaxSize() throws {
        var grid = GridSize(-1)
        XCTAssertEqual(grid.maxSize, 100)

        grid = GridSize(9)
        XCTAssertEqual(grid.maxSize, 100)

        grid = GridSize(10)
        XCTAssertEqual(grid.maxSize, 100)

        grid = GridSize(20)
        XCTAssertEqual(grid.maxSize, 400)
    }
}
