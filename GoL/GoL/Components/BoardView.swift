//
//  BoardView.swift
//  foo
//
//  Created by Bryan D'Haeseleer on 22/11/2021.
//

import UIKit

/// Based on :  https://learnappmaking.com/game-of-life-in-swift-how-to/
final class BoardView: UIView {
    var grid = Grid()

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.clear(CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.height))
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.height))
        context.fillPath()

        let size = grid.gridSize.size
        let cellSize = (width: bounds.width / CGFloat(size), height: bounds.height / CGFloat(size))
        context.setFillColor(UIColor.black.cgColor)

        for x in 0..<size {
            for y in 0..<size {
                let index = (x*grid.gridSize.size)+y
                if grid.cells[index].state.isAlive() {
                    context.addRect(CGRect(x: CGFloat(x) * cellSize.width, y: CGFloat(y) * cellSize.height, width: cellSize.width, height: cellSize.height))
                    context.fillPath()
                }
            }
        }
    }
}
