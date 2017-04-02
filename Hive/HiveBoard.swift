//
//  HiveBoard.swift
//  Hive
//
//  Created by Александр on 08.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import Foundation
import CoreGraphics

class HiveBoard {
    var board : [[Piece?]] = []
    var centerX, centerY : Int
    
    init(rowsCount : Int, columnsCount: Int) {
        for _ in 0...rowsCount {
            board.append(Array(repeating: nil, count: columnsCount))
        }
        centerX = columnsCount/2
        centerY = rowsCount/2
    }
    
    func setPiece(piece: Piece, toPlace location: PiecePosition){
        board[location.column+centerX][location.row+centerY] = piece
    }
}
