//
//  HiveGame.swift
//  Hive
//
//  Created by Александр on 08.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import Foundation

class HiveGame : PlayerDelegate{
    let players : Dictionary<PieceColor, Player>!
    let board : HiveBoard
    var currentColor : PieceColor = .white
    
    var hand : [PieceType] {
        get{
            return (players[currentColor]?.hand)!
        }
    }
    
    init(whitePlayer : Player, blackPlayer: Player, board: HiveBoard){
        players = [.white : whitePlayer, .black : blackPlayer]
        self.board = board
    }
    
    func start(){
        players[currentColor]?.move(onBoard: board, color: currentColor)
    }
    
    func playerDidMove() {
        currentColor.invert()
        players[currentColor]?.move(onBoard: board, color: currentColor)
    }
}
