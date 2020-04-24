//
//  ReversiBoard.swift
//  Reversi
//
//  Created by Kuroruri on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

public class ReversiBoard {
    /// 盤の幅を表します。
    public let width: Int
    
    /// 盤の高さを返します。
    public let height: Int
    
    /// 盤のセルの `x` の範囲を返します。
    public let xRange: Range<Int>
    
    /// 盤のセルの `y` の範囲を返します。
    public let yRange: Range<Int>
    
    public var board: Array<Disk?>
    
    public init(width: Int = 8, height: Int = 8) {
        precondition(width % 2 == 0 && width > 0)
        precondition(height % 2 == 0 && height > 0)
        
        self.width = width
        self.height = height
        xRange = 0..<width
        yRange = 0..<height
        
        board = Array<Disk?>(repeating: nil, count: width * height)
        setDisk(.light, atX: width / 2 - 1, y: height / 2 - 1)
        setDisk(.dark,  atX: width / 2,     y: height / 2 - 1)
        setDisk(.dark,  atX: width / 2 - 1, y: height / 2)
        setDisk(.light, atX: width / 2,     y: height / 2)
    }
    
    public func diskAt(x: Int, y: Int) -> Disk? {
        guard xRange.contains(x) && yRange.contains(y) else { return nil }
        return board[arrayIndexAt(x: x, y: y)]
    }
    
    public func setDisk(_ disk: Disk?, atX x: Int, y: Int) {
        precondition(xRange.contains(x) && yRange.contains(y), "Outside")
        // FIXME: 本当はゲーム中に石の上書きはできないが、ゲームのロードに使ってるので一時的に許可してる
        // precondition(board[x*y] == nil, "Disk exist")
        board[arrayIndexAt(x: x, y: y)] = disk
    }
    
    private func arrayIndexAt(x: Int, y: Int) -> Int {
        return y * width + x
    }
    
}
