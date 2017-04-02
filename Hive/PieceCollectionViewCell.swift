//
//  PieceCollectionViewCell.swift
//  Hive
//
//  Created by Александр on 08.01.17.
//  Copyright © 2017 Hlebnikov A. All rights reserved.
//

import UIKit

class PieceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView : UIImageView!
    
    var image : UIImage?{
        get{
            return imageView.image
        }
        
        set{
            imageView.image = newValue
        }

    }
    
}
