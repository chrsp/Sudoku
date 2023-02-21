//
//  Game.swift
//  
//
//  Created by Charles Prado on 21/02/2023.
//

import Foundation

typealias Unit = [Int: [Square]]

public struct Game {
    public private(set) var board: [Square]
    
    private(set) var rows: Unit = .init()
    private(set) var columns: Unit = .init()
    private(set) var blocks: Unit = .init()

    public init(game: [[Int]]) {
        self.board = []

        for (rowIndex, row) in game.enumerated() {
            for (columnIndex, value) in row.enumerated() {
                let block = (rowIndex / 3) * 3 + (columnIndex / 3)
                let isPermanent = value != 0

                let square = Square(value: value, row: rowIndex, column: columnIndex, block: block, isPermanent: isPermanent)

                rows[rowIndex, default: []].append(square)
                columns[columnIndex, default: []].append(square)
                blocks[block, default: []].append(square)

                board.append(square)
            }
        }
    }
}

extension Game {
    public func canAdd(_ value: Int, to square: Square) -> Bool {
        rows[square.row]?.contains(where: { $0.value == value }) == false &&
        columns[square.column]?.contains(where: { $0.value == value }) == false &&
        blocks[square.block]?.contains(where: { $0.value == value }) == false
    }

    public func squareAt(row: Int, col: Int) -> Square? {
        board[row + (9 * col)]
    }
    
    public var firstEmptySquare: Square? {
        board.first(where: { $0.value == 0 })
    }
}

public extension Game {
    static func fakeData() -> [[Int]] {
        [[0, 0, 0, 0, 0, 0, 6, 9, 0],
         [0, 2, 8, 1, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 0, 5],
         [6, 0, 0, 4, 0, 0, 3, 0, 1],
         [0, 3, 0, 0, 5, 0, 0, 0, 0],
         [0, 0, 9, 0, 0, 0, 0, 8, 0],
         [1, 0, 0, 0, 3, 0, 0, 4, 0],
         [3, 9, 6, 5, 0, 7, 0, 0, 0],
         [0, 8, 0, 0, 0, 0, 0, 0, 0],
        ]
    }
}
