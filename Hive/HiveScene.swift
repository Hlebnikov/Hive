//
//  HiveScene.swift
//  Hive
//
//  Created by Александр on 07.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import UIKit
import SpriteKit

protocol HiveSceneDelegate {
    func nextPiece() -> Piece?
    func didSetPiece(piece: Piece, coord: CGPoint)
}

class HiveScene: SKScene {
    var landBackground:SKTileMapNode!
    var hiveSceneDelegate: HiveSceneDelegate?
    
    
    func loadSceneNodes() {
        guard let landBackground = childNode(withName: "Tile Map Node")
            as? SKTileMapNode else {
                fatalError("Background node not loaded")
        }
        self.landBackground = landBackground
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loadSceneNodes()
        guard let touch = touches.first else { return }
        let targetLocation = touch.location(in: self)
        
        guard let tileSet = SKTileSet(named: "pieces") else {
            print("pieces not found")
            return
        }
        
        let tileGroups = tileSet.tileGroups
        
        let piecesName = hiveSceneDelegate?.nextPiece()?.description
        guard let piece = tileGroups.first(where: {$0.name == piecesName}) else {
            fatalError("No \(piecesName) tile definition found")
        }
        
        let column = landBackground.tileColumnIndex(fromPosition: targetLocation)
        let row = landBackground.tileRowIndex(fromPosition: targetLocation)
        let groundTile = landBackground.tileDefinition(atColumn: column, row: row)
        
        print("column \(column), row \(row)")
        let tile = groundTile == nil ? piece : nil
        
        landBackground.setTileGroup(tile, forColumn: column, row: row)
        hiveSceneDelegate?.didSetPiece(piece: (hiveSceneDelegate?.nextPiece())!, coord: CGPoint(x: column, y: row))
    }
}
