//
//  Board.swift
//  Sudoku
//
//  Created by Charles Prado on 15/02/2023.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var viewModel: BoardViewModel

    var body: some View {
        VStack(spacing: 0) {
            sudokuBoard
            solveButton
        }
        .padding()
    }

    var sudokuBoard: some View {
        VStack(spacing: 0) {
            ForEach(0..<9) { row in
                HStack(spacing: 0) {
                    ForEach(0..<9) { column in
                        SquareView(viewModel: viewModel.squareViewModel(at: row, column: column))
                    }
                }
            }
        }
    }

    var solveButton: some View {
        Button("Solve!") {
            let _ = viewModel.solveSudoku()
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BoardViewModel(data: BoardViewModel.fakeData())
        BoardView(viewModel: viewModel)
    }
}
