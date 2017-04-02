//
//  Piece.swift
//  Hive
//
//  Created by Александр on 08.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import UIKit

class Piece {
    let type : PieceType
    let color : PieceColor
    
    init(type : PieceType, color: PieceColor) {
        self.type = type
        self.color = color
    }
    
    var description : String {
        return type.description + "_" + color.description
    }
}
