//
//  GroceryModel.swift
//  GroceryList
//
//  Created by afsana-farheen on 28/02/23.
//

import SwiftUI


struct GroceryModel:Identifiable{
    let id = UUID()
    var categories:[GroceryCategory]
}

enum GroceryCategory:String,CaseIterable{
    case fruits
    case vegetables
    case dairyProducts
    case snacks
    case instantFood
    
    var categoryList:[String]{
        switch self {
        case .fruits:
            return ["Apples","Oranges","Guava","Pineapple","Grapes"]
        case .vegetables:
            return ["Onion","Tomato","Brinjal","Potato","Beans"]
        case .dairyProducts:
            return ["Milk","Bread","Paneer","Wheat Bread","Eggs"]
        case .snacks:
            return ["Biscuits","chips","Fench fries","Nuggets","Puffs"]
        case .instantFood:
            return ["Noodles","Maggi","Peanut butter","Pizza","Burger"]
        }
        return [""]
    }
}

extension View {
    @ViewBuilder
    func groceryListStyle(catName:GroceryCategory) -> some View {
        switch catName{
        case .fruits:
            self.listStyle(.insetGrouped)
        case .dairyProducts:
            self.listStyle(.automatic)
        case .vegetables:
            self.listStyle(.grouped)
        case .instantFood:
            self.listStyle(.sidebar)
        case .snacks:
            self.listStyle(.inset)
        }
        
    }
}
