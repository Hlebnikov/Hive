//
//  Player.swift
//  Hive
//
//  Created by Александр on 08.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import Foundation

protocol PlayerDelegate {
    func playerDidMove()
}

protocol Player {
    var hand : [PieceType]{get set}
    func move(onBoard board: HiveBoard, color: PieceColor)
}
