//
//  ReversiBoardTest.swift
//  ReversiTests
//
//  Created by Kuroruri on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import XCTest
@testable import Reversi

class ReversiBoardTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialization() {
        let board = ReversiBoard(width: 4, height: 4)
        
        
        let expected = """
                        ----
                        -○●-
                        -●○-
                        ----\n
                        """
        
        XCTAssertEqual(board.boardAsString, expected)
    }
    
    func testSetDisk() {
        let board = ReversiBoard(width: 6, height: 6)
        
        // 本当にただ置くだけなので挟まれたやつがひっくり返ってないのは正しい
        let expected = """
                        ------
                        ------
                        -●○●--
                        --●○--
                        ------
                        ------\n
                        """
        
        board.setDisk(.dark, atX: 1, y: 2)
        
        XCTAssertEqual(board.boardAsString, expected)
    }

}

fileprivate extension ReversiBoard {
    var boardAsString: String {
        var str = ""
        
        for y in yRange {
            for x in xRange {
                str += diskAt(x: x, y: y).asString
            }
            str += "\n"
        }
        return str
    }
}

fileprivate extension Optional where Wrapped == Disk {
    var asString: String {
        switch self {
        case .dark:
            return "●"
        case .light:
            return "○"
        default:
            return "-"
        }
    }
}
