//
//  PieceType.swift
//  Hive
//
//  Created by Александр on 07.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import Foundation
import UIKit

enum PieceType {
    case Grasshoper
    case Queen
    case Bug
    case Ant
    case Spider
}

extension PieceType{
    var description : String{
        switch self {
        case .Grasshoper:
            return "grasshoper"
        case .Queen:
            return "queen"
        case .Ant:
            return "ant"
        case .Bug:
            return "bug"
        case .Spider:
            return "spider"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .Grasshoper:
            return #imageLiteral(resourceName: "grasshopper")
        case .Ant:
            return #imageLiteral(resourceName: "ant")
        case .Bug:
            return #imageLiteral(resourceName: "bug")
        case .Queen:
            return #imageLiteral(resourceName: "queen")
        case .Spider:
            return #imageLiteral(resourceName: "spider")
        }
    }
}
