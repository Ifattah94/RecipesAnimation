//
//  RecipesCell.swift
//  RecipesAnimation
//
//  Created by C4Q on 10/15/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit


private enum State {
    case expanded
    case collapsed
    
    var change: State {
        switch self {
        case .expanded: return .collapsed
        case .collapsed: return .expanded
        }
    }
}

class RecipesCell: UICollectionViewCell {
    
    lazy var recipeImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.alpha = 0.7
        iv.layer.cornerRadius = self.cornerRadius
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
        label.alpha = 0
        label.font = UIFont(name: "System", size: 17)
        return label
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        button.alpha = 0
        button.contentMode = .scaleAspectFill
        button.isEnabled = true
        button.showsTouchWhenHighlighted = true 
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var initialFrame: CGRect?
    private var state: State = .collapsed
    private let cornerRadius: CGFloat = 6
    
    private var collectionView: UICollectionView?
       private var index: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureRecipeImageViewConstraints()
        configureRecipeNameLabel()
        configureDescriptionLabelConstraints()
        configureCloseButtonConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func closeButtonPressed() {
        toggle()
    }
    
    
    
    func toggle() {
        switch state {
        case .expanded:
            collapse()
        case .collapsed:
            expand()
        }
    }
    
    
    private func collapse() {
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            guard let collectionView = self.collectionView, let index = self.index else { return }
                       
                       self.descriptionLabel.alpha = 0
                       self.closeButton.alpha = 0
                       
                       self.layer.cornerRadius = self.cornerRadius
                       self.frame = self.initialFrame!
                       
                       if let leftCell = collectionView.cellForItem(at: IndexPath(row: index - 1, section: 0)) {
                        //Animation left cell to fade in when view collapses
                        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                             leftCell.center.x += 50
                            leftCell.alpha = 1
                        }, completion: nil)
                        
                        
                          
                        
                       }
                       
                       if let rightCell = collectionView.cellForItem(at: IndexPath(row: index + 1, section: 0)) {
                        //Animate right cell to fade in when view collpases
                        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                            rightCell.center.x -= 50
                            rightCell.alpha = 1
                        }, completion: nil)
                           
                       }
            
            
                       
                       self.layoutIfNeeded()
        }) { (finished) in
            self.state = self.state.change
            self.collectionView?.visibleCells.forEach({ (cell) in
                cell.isHidden = false
            })
            self.collectionView?.isScrollEnabled = true
            self.collectionView?.allowsSelection = true
        }
    }
    
    
    private func expand() {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            guard let collectionView = self.collectionView, let index = self.index else { return }
                       self.initialFrame = self.frame
                       self.descriptionLabel.alpha = 1
                       self.closeButton.alpha = 1
                       
                       self.layer.cornerRadius = 0
                       self.frame = CGRect(x: collectionView.contentOffset.x, y:0 , width: collectionView.frame.width, height: collectionView.frame.height)
                       if let leftCell = collectionView.cellForItem(at: IndexPath(row: index - 1, section: 0)) {
                        
                        
                        //Animate left cell fading out when cell expands.
                        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                            leftCell.center.x -= 50
                            leftCell.alpha = 0
                        }, completion: nil)
                        
                                  
                       
                              }
                              
                              if let rightCell = collectionView.cellForItem(at: IndexPath(row: index + 1, section: 0)) {
                                //Animate right cell fading out when cell expands
                                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                                    rightCell.alpha = 0
                                    rightCell.center.x += 50
                                }, completion: nil)
                                  
                                
                                
                                
                              }
                              
                              self.layoutIfNeeded()
        }) { (finished) in
            self.state = self.state.change
            self.collectionView?.isScrollEnabled = false
            self.collectionView?.allowsSelection = false
        }
        
    
    }
    
    public func configureCell(with recipe: Recipe, collectionView: UICollectionView, index: Int) {
        recipeNameLabel.text = recipe.name
        recipeImageView.image = UIImage(named: recipe.imageName)
        descriptionLabel.text = recipe.summary
        self.collectionView = collectionView
        self.index = index 
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
    
    private func configureCloseButtonConstraints() {
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor), closeButton.widthAnchor.constraint(equalToConstant: 40), closeButton.topAnchor.constraint(equalTo: self.topAnchor), closeButton.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    
}
