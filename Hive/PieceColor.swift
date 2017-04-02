//
//  PieceColor.swift
//  Hive
//
//  Created by Александр on 08.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import Foundation

enum PieceColor {
    case white
    case black
}

extension PieceColor {
    mutating func invert(){
        if self == .white {
            self = .black
        } else {
            self = .white
        }
    }
    
    var description : String{
        return self == .white ? "white" : "black"
    }
}
