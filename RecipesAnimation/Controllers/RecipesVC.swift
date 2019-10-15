//
//  RecipesVC.swift
//  RecipesAnimation
//
//  Created by C4Q on 10/15/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class RecipesVC: UIViewController {

    //MARK: UI Objects
    lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "background")
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    lazy var recipesCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .clear
        cv.clipsToBounds = true
        
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundImageConstraints()
        configureRecipesCollectionView()

        // Do any additional setup after loading the view.
    }
    

    
    //MARK: Constraint functions
   
    private func configureBackgroundImageConstraints() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), backgroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
    }
    
    private func configureRecipesCollectionView() {
        view.addSubview(recipesCollectionView)
        recipesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([recipesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), recipesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), recipesCollectionView.topAnchor.constraint(equalTo: view.topAnchor), recipesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
    }

}
