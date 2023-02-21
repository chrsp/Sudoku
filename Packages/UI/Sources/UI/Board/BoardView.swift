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
                sudokuBoard.border(Color.black, width: 1.0)
                gridView
            }
            solveButton
            solveStepByStepButton
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
    
    private var gridView: some View {
            ZStack {
                VStack(spacing: 40) {
                    Spacer(minLength: 40)
                    Color.black.opacity(0.4).frame(width: 360, height: 0.5)
                    Color.black.opacity(0.4).frame(width: 360, height: 0.5)
                    Color.black.opacity(0.8).frame(width: 360, height: 1.0)
                    
                    Color.black.opacity(0.4).frame(width: 360, height: 0.5)
                    Color.black.opacity(0.4).frame(width: 360, height: 0.5)
                    Color.black.opacity(0.8).frame(width: 360, height: 1.0)
                    
                    Color.black.opacity(0.4).frame(width: 360, height: 0.5)
                    Color.black.opacity(0.4).frame(width: 360, height: 0.5)
                    Spacer(minLength: 40)
                }
                
                HStack(spacing: 40) {
                    Spacer(minLength: 40)
                    Color.black.opacity(0.4).frame(width: 0.5, height: 360)
                    Color.black.opacity(0.4).frame(width: 0.5, height: 360)
                    Color.black.opacity(0.8).frame(width: 1.0, height: 360)
                    
                    Color.black.opacity(0.4).frame(width: 0.5, height: 360)
                    Color.black.opacity(0.4).frame(width: 0.5, height: 360)
                    Color.black.opacity(0.8).frame(width: 1.0, height: 360)
                    
                    Color.black.opacity(0.4).frame(width: 0.5, height: 360)
                    Color.black.opacity(0.4).frame(width: 0.5, height: 360)
                    Spacer(minLength: 40)
                }
            }
    }

    private var solveButton: some View {
        Button("Solve!") {
            let _ = viewModel.solveSudoku()
        }
    }
    
    private var solveStepByStepButton: some View {
        Button("Solve Step By Step!") {
            let _ = viewModel.solveSudokuStepByStep()
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
