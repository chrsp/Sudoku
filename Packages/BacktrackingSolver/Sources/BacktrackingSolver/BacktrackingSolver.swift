import Foundation
import Models

typealias Unit = [Int: [Square]]

public struct BacktrackingSolver {

    public var didFinishSolving: (([Square]) -> Void)?
    public var didUpdateSolution: (([Square]) -> Void)?

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

                let square = Square(value: value,
                                    row: rowIndex,
                                    column: columnIndex,
                                    block: block,
                                    isPermanent: isPermanent)

                rows[rowIndex, default: []].append(square)
                columns[columnIndex, default: []].append(square)
                blocks[block, default: []].append(square)

                board.append(square)
            }
        }
    }

    public func solve() -> Bool {
        let firstEmptySquareIndex = board.firstIndex(where: { $0.value == 0 })

        if firstEmptySquareIndex == nil {
            return true
        }

        for value in 1...9 {
            if canAdd(value, to: board[firstEmptySquareIndex!]) {
                board[firstEmptySquareIndex!].value = value
                didUpdateSolution?(board)
                if solve() {
                    didFinishSolving?(board)
                    return true
                }
                board[firstEmptySquareIndex!].value = 0
                didUpdateSolution?(board)
            }
        }
        return false
    }
}

// MARK: - Helpers
extension BacktrackingSolver {
    func canAdd(_ value: Int, to square: Square) -> Bool {
        rows[square.row]?.contains(where: { $0.value == value }) == false &&
        columns[square.column]?.contains(where: { $0.value == value }) == false &&
        blocks[square.block]?.contains(where: { $0.value == value }) == false
    }

    func squareAt(row: Int, col: Int) -> Square? {
        board[row + (9 * col)]
    }

    func squareArrayToRawFormat(squareArray: [Square]) -> [[Int]] {
        (0..<9).map { i in
            let startIndex = i * 9
            let endIndex = (i + 1) * 9
            let subArray = Array(squareArray[startIndex..<endIndex])
            return subArray.map { $0.value }
        }
    }
}

public extension BacktrackingSolver {
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
