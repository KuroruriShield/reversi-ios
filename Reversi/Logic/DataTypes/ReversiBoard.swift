//
//  ReversiBoard.swift
//  Reversi
//
//  Created by Kuroruri on 2020/04/24.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

typealias ReversiBoard = [Disk?]

public extension ReversiBoard {
    /// 盤の幅（ `8` ）を表します。
    var width: Int { 8 }
    
    /// 盤の高さ（ `8` ）を返します。
    var height: Int { 8 }
    
    /// 盤のセルの `x` の範囲（ `0 ..< 8` ）を返します。
    var xRange: Range<Int> { 0 ..< width }
    
    /// 盤のセルの `y` の範囲（ `0 ..< 8` ）を返します。
    var yRange: Range<Int> { 0 ..< height }
    
    func diskAt(x: Int, y: Int) -> Disk? {
        guard xRange.contains(x) && yRange.contains(y) else { return nil }
        return self[y * width + x]
    }

}
