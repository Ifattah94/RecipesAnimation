//
//  Recipe.swift
//  RecipesAnimation
//
//  Created by C4Q on 10/15/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation

struct Recipe {
    let name: String
    let imageName: String
    let summary: String
    
    
    static func buildRecipes() -> [Recipe] {
        let porkCurrants = Recipe(name: "Braised Pork Apricots and Currants", imageName: "BraisedPorkCurrants", summary: "This Popular Recipe is a spin on Chef Elana's mother's recipe for holiday chicken, a warm and flavorful dish served for just about every celebratory occasion. A swap for boneless pork chops gives the simple yet impressive dish a special twist. The meat is seared, then doused in a sauce of fresh orange juice, brown sugar, and white wine, and braised with shallots, apricots, and currants for sweet and tangy balance. The aroma from this dish alone will start to bring some holiday magic to your kitchen.")
        
        let capreseChicken = Recipe(name: "Caprese Chicken over Warm Spinach Salad", imageName: "CapreseChicken", summary: "Some of our most popular meals come from combining our favorite dishes in the Test Kitchen (because sometimes you can't choose and, therefore, must have both). In this Popular Recipe, it's a mashup of pounded and pan-seared chicken paillard plus Caprese salad, the classic Italian trio of tomato, basil, and mozzarella. We're adding even more of an Italian spin by dusting the chicken with Parmesan for a crunchy, salty, perfectly golden crust. You really can have it all...")
        
        let chickenCoconutSoup = Recipe(name: "Chicken and Coconut Soup", imageName: "ChickenCoconutSoup", summary: "We love using rich, aromatic coconut milk as a base for soups. Here, we’re infusing it with ginger, Thai chile, and fish sauce for a supremely fragrant broth that’s swimming with tender cubes of chicken and sautéed mushrooms. It’s ladled over sticky rice and sprinkled with fragrant cilantro and scallions. This dinner is seriously souperb (we couldn’t resist)!")
        
        
        let chickenFettucini = Recipe(name: "Creamy Chicken Fettuccine", imageName: "CreamyChickenFettuccine", summary: "Creamy, cheesy Alfredo sauce is one of our favorite pasta toppings. If you've never made it at home, now's your chance—and you'll be delighted at how quickly everything comes together (30 minutes, that's how fast!). Simply combine butter, flour, cream, garlic, and white wine, then whisk the mixture as it cooks for smooth, rich texture. Add Parmesan, then toss with fettuccine noodles, tender slices of chicken, and tomatoes for the hearty, saucy Italian comfort dish you've been craving.")
        
        
        let frenchOnionSoupBurger = Recipe(name: "French Onion Soup Burger", imageName: "FrenchOnionSoupBurger", summary: "We’d like to reintroduce you to one of our most epic mashups: classic French onion soup in burger form. In this Popular Recipe, beef burgers are slathered with melty Gruyère cheese and sweet caramelized onion gravy. The burgers are sandwiched between toasted English muffins that have the ideal craggy surface for absorbing the mustard and the gravy. Served with a heap of arugula salad alongside, this powerhouse meal will have you wanting more long after the last bite.")
        
        
        return [porkCurrants, capreseChicken, chickenCoconutSoup, chickenFettucini, frenchOnionSoupBurger]
        
    }
    
    
    
}
