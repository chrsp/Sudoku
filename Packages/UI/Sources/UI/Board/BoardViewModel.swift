//
//  BoardViewModel.swift
//  Sudoku
//
//  Created by Charles Prado on 20/02/2023.
//

import Foundation
import BacktrackingSolver
import Models

public class BoardViewModel: ObservableObject {
    @Published var data: [Square]
    private var solver: BacktrackingSolver!

    public init(data: [[Int]]) {
        solver = .init(game: data)
        self.data = solver.board
//        
//        solver.didFinishSolving =  { newData in
//            self.data = newData
//        }

        solver.didUpdateSolution =  { newData in
            self.data = newData
        }
    }

    func solveSudoku() {
        let _ = solver.solve()
    }

    func squareViewModel(at row: Int, column: Int) -> SquareViewModel {
        SquareViewModel(square: data[row+9*column])
    }
}

public extension BoardViewModel {
    static func fakeData() -> [[Int]] {
        [[0, 1, 0, 0, 0, 0, 0, 6, 9],
         [4, 0, 6, 0, 0, 0, 0, 7, 5],
         [7, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 7, 0, 4, 0, 0],
         [1, 0, 0, 0, 2, 0, 0, 0, 0],
         [3, 0, 0, 5, 0, 1, 9, 0, 0],
         [0, 2, 7, 0, 0, 3, 0, 0, 0],
         [0, 0, 0, 9, 0, 0, 0, 0, 7],
         [0, 0, 9, 0, 0, 0, 8, 0, 0],
        ]
    }
}
