//
//  HumanPlayer.swift
//  Hive
//
//  Created by Александр on 08.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import Foundation

class HumanPlayer: Player {
    var delegate : PlayerDelegate?
    var active = false
    var hand : [PieceType] = [.Grasshoper, .Bug, .Spider, .Ant, .Queen]

    
    func move(onBoard board: HiveBoard, color: PieceColor){
        active = true
    }
    
    
}
