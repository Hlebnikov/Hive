//
//  AIPalyer.swift
//  Hive
//
//  Created by Александр on 08.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import Foundation

class AIPlayer : Player {
    var hand : [PieceType] = [.Grasshoper, .Bug, .Spider, .Ant, .Queen]

    var delegate : PlayerDelegate?
    
    func move(onBoard board: HiveBoard, color: PieceColor){
        delegate?.playerDidMove()
    }
}
