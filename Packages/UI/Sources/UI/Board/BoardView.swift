//
//  Board.swift
// 
//
//  Created by Charles Prado on 15/02/2023.
//

import SwiftUI

public struct BoardView: View {
    @ObservedObject var viewModel: BoardViewModel
    
    public init(viewModel: BoardViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: 0) {
            sudokuBoard
            solveButton
        }
        .padding()
    }

    private var sudokuBoard: some View {
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

    private var solveButton: some View {
        Button("Solve!") {
            let _ = viewModel.solveSudoku()
        }
    }
}

import Models

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BoardViewModel(data: Game.fakeData())
        BoardView(viewModel: viewModel)
    }
}
