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
        VStack(spacing: 16) {
            ZStack {
                PlayfieldView()
                sudokuBoard
                    .border(Color.black, width: 1.0)
            }
            solveButton("Create!", viewModel.createSudoku)
            solveButton("Solve!", viewModel.solveSudoku)
            solveButton("Solve Step By Step!", viewModel.solveSudokuStepByStep)
        }
        .padding()
    }

    private var sudokuBoard: some View {
        HStack(spacing: 0) {
            ForEach(0..<9) { row in
                VStack(spacing: 0) {
                    ForEach(0..<9) { column in
                        SquareView(viewModel: viewModel.squareViewModel(at: row, column: column))
                    }
                }
            }
        }
    }
    
    private func solveButton(_ title: String, _ action: @escaping () -> Void) -> some View {
        Button(title) {
            let _ = action()
        }
    }
}

import GameEngine

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BoardViewModel(data: Game.fakeData())
        BoardView(viewModel: viewModel)
    }
}
