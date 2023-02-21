import Foundation
import Models

public struct BacktrackingSolver {

    public var didFinishSolving: (([Square]) -> Void)?
    public var didUpdateSolution: (([Square]) -> Void)?
    
    public private(set) var game: Game
    
    public init(game: Game) {
        self.game = game
    }
    
    public func solve() -> Bool {
        let firstEmptySquareIndex = game.firstEmptySquareIndex

        if firstEmptySquareIndex == nil {
            return true
        }

        for value in 1...9 {
            if game.canAdd(value, to: game.board[firstEmptySquareIndex!]) {
                game.board[firstEmptySquareIndex!].value = value
                didUpdateSolution?(game.board)
                if solve() {
                    didFinishSolving?(game.board)
                    return true
                }
                game.board[firstEmptySquareIndex!].value = 0
                didUpdateSolution?(game.board)
            }
        }
        return false
    }
}

// MARK: - Helpers
extension BacktrackingSolver {
    func squareArrayToRawFormat(squareArray: [Square]) -> [[Int]] {
        (0..<9).map { i in
            let startIndex = i * 9
            let endIndex = (i + 1) * 9
            let subArray = Array(squareArray[startIndex..<endIndex])
            return subArray.map { $0.value }
        }
    }
}
