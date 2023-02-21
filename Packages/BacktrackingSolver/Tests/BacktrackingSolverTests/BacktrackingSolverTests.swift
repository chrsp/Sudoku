import XCTest
@testable import BacktrackingSolver

final class BacktrackingSolverTests: XCTestCase {
    func testRulesCreation() throws {
        let sut = BacktrackingSolver(game: BacktrackingSolver.fakeData())
        // There will be only 81 squares (9 rows x 9 cols)
        XCTAssertEqual(sut.board.count, 81)
        // There will be only 9 rows
        XCTAssertEqual(sut.rows.count, 9)
        // There will be only 9 cols
        XCTAssertEqual(sut.columns.count, 9)
        // There will be only 9 blocks
        XCTAssertEqual(sut.blocks.count, 9)
    }

    func testCanAddValueToSquare() throws {
        let sut = BacktrackingSolver(game: BacktrackingSolver.fakeData())
        // Cannot Add value 6 to the first square of row 0 (because that row already has a 6)
        XCTAssertFalse(sut.canAdd(6, to: sut.squareAt(row: 0, col: 0)!))
        // Cannot Add value 6 to the first square of row 1 (because that column already has a 6)
        XCTAssertFalse(sut.canAdd(6, to: sut.squareAt(row: 1, col: 0)!))
        // Can Add value 6 to the second square of row 1
        XCTAssertTrue(sut.canAdd(6, to: sut.squareAt(row: 1, col: 1)!))
    }

    func testSolve() throws {
        let sut = BacktrackingSolver(game: BacktrackingSolver.fakeData())
        XCTAssertTrue(sut.solve())
    }
}
