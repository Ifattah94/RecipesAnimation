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
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.alpha = 0.7
        return iv
    }()
    
    lazy var recipeNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Noteworthy-Bold", size: 20)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.clipsToBounds = false
         label.contentMode = .left
        label.isHidden = true 
        label.font = UIFont(name: "System", size: 17)
        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureRecipeImageViewConstraints()
        configureRecipeNameLabel()
        configureDescriptionLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    public func configureCell(with recipe: Recipe) {
        recipeNameLabel.text = recipe.name
        recipeImageView.image = UIImage(named: recipe.imageName)
        descriptionLabel.text = recipe.summary
    }
    
    
    private func configureRecipeImageViewConstraints() {
        addSubview(recipeImageView)
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([recipeImageView.topAnchor.constraint(equalTo: self.topAnchor), recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor), recipeImageView.trailingAnchor.constraint(equalTo: trailingAnchor), recipeImageView.heightAnchor.constraint(equalToConstant: 350)])
        
    }
    
    
    private func configureRecipeNameLabel() {
        addSubview(recipeNameLabel)
        recipeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([recipeNameLabel.centerXAnchor.constraint(equalTo: recipeImageView.centerXAnchor), recipeNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10), recipeNameLabel.heightAnchor.constraint(equalToConstant: 30)])
        
    }
    
    private func configureDescriptionLabelConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor), descriptionLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300), descriptionLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 25)])
    }
    
    
    
    
}
