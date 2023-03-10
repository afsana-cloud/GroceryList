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
    case fruits = "Fruits"
    case vegetables = "Vegetables"
    case dairyProducts = "Dairy Products"
    case snacks = "Snacks"
    case instantFood = "Instant Food"
    
    var categoryList:[String]{
        switch self {
        case .fruits:
            return ["Apples","Oranges","Guava","Pineapple","Grapes"]
        case .vegetables:
            return ["Onion","Tomato","Brinjal","Potato","Beans"]
        case .dairyProducts:
            return ["Milk","Bread","Paneer","Wheat Bread","Eggs"]
        case .snacks:
            return ["Biscuits","chips","French fries","Nuggets","Puffs"]
        case .instantFood:
            return ["Noodles","Maggi","Peanut butter","Pizza","Burger"]
        }
    }
    var sectionName:String{
        switch self {
        case .fruits:
            return "Fruits"
        case .vegetables:
            return "Vegetables"
        case .dairyProducts:
            return "Dairy Products "
        case .snacks:
            return "Snacks"
        case .instantFood:
            return "Instant food"
        }
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

struct GroceryItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [GroceryItem]? = nil
    var description: String {
        switch children {
        case nil:
            return "\(name)"
        case .some(let children):
            return children.isEmpty ? "\(name)" : "\(name)"
        }
    }
}
