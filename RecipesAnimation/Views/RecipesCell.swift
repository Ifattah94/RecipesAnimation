//
//  RecipesCell.swift
//  RecipesAnimation
//
//  Created by C4Q on 10/15/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class RecipesCell: UICollectionViewCell {
    
    lazy var recipeImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
