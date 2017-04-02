//
//  ViewController.swift
//  Hive
//
//  Created by Александр on 31.12.16.
//  Copyright © 2016 Hlebnikov A. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController{
    
    @IBOutlet weak var handCollection: UICollectionView!
    @IBOutlet weak var sceneView : SKView!
    @IBOutlet weak var selectedPieceImageView : UIImageView!
    
    var game : HiveGame!
    
    var selectedPiece : PieceType? = .Grasshoper{
        didSet{
            selectedPieceImageView.image = selectedPiece?.image
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let whitePlayer = HumanPlayer()
        let blackPlayer = HumanPlayer()
        let board = HiveBoard(rowsCount: 25, columnsCount: 25)
        
        game = HiveGame(whitePlayer: whitePlayer,
                        blackPlayer: blackPlayer,
                        board: board)
        
        game.start()
    }
    
    func setupUI(){
        if let scene = SKScene(fileNamed: "HiveScene") as? HiveScene {
            scene.scaleMode = .aspectFill
            scene.hiveSceneDelegate = self
            sceneView.presentScene(scene)
        }
        
        handCollection.dataSource = self
        handCollection.delegate = self
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: - Collection view data source
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return game.hand.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PieceCollectionViewCell
        cell.image = game.hand[indexPath.item].image
        return cell
    }
    
    //MARK: = Collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPiece = game.hand[indexPath.item]
    }
}

extension GameViewController: HiveSceneDelegate{
    func nextPiece() -> Piece?{
        if selectedPiece != nil {
            return Piece(type: selectedPiece!, color: game.currentColor)
        }else{
            return nil
        }
    }
    
    func didSetPiece(piece: Piece, coord: CGPoint) {
        game.playerDidMove()
    }
}



