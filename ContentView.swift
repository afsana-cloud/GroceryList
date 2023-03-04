//
//  ContentView.swift
//  GroceryList
//
//  Created by afsana-farheen on 28/02/23.
//

import SwiftUI

struct GroceryListView: View {
    var model:GroceryModel = GroceryModel(categories: GroceryCategory.allCases)

    var body: some View {
        NavigationView {
            List{
                ForEach(model.categories,id: \.self){ data in
                    NavigationLink(destination: GroceryDetailView(categoryName: data)){
                        Section{
                            Text(data.rawValue)
                        }
                    }
                }
            }.navigationTitle("Grocery List")
                .listStyle(.plain)
        }
    }
}

struct GroceryDetailView:View{
    @State var categoryName:GroceryCategory
    var body: some View {
        List{
            ForEach(categoryName.categoryList,id: \.self){ data in
                if categoryName == .instantFood{
                    Section{
                        Text(data)
                    }
                }else{
                    Text(data)
                }
            }
        }.groceryListStyle(catName: categoryName)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView()
    }
}


