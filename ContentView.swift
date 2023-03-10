//
//  ContentView.swift
//  GroceryList
//
//  Created by afsana-farheen on 28/02/23.
//

import SwiftUI

struct GroceryListView: View {
   @State var model:GroceryModel = GroceryModel(categories: GroceryCategory.allCases)
    @State var cats:[GroceryItem]  = [
        GroceryItem(name: "Fruits", children:
          [GroceryItem(name: "Apple", children:
            [GroceryItem(name: "Green apple", children:nil),
             GroceryItem(name: "Kashmir apple", children:nil)])
            ]),
        GroceryItem(name: "Vegetables", children:
          [GroceryItem(name: "Tomato", children:
            [GroceryItem(name: "Red Tomato", children:nil),
             GroceryItem(name: "Green Tomato", children:nil)])
            ]),
      ]
    @State var isHierarychy:Bool = false

    var body: some View {
        NavigationView {
            if isHierarychy{
                List(cats, children: \.children) { item in
                    Text(item.description)
                }.listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }else{
                List{
                    ForEach(model.categories,id: \.self){ data in
                        if isHierarychy{

                        }else{
                            NavigationLink(destination: GroceryDetailView(categoryName: data)){
                                Section{
                                    Text(data.rawValue)
                                }
                            }
                            .swipeActions(edge: .trailing) {
                                Button {
                                    self.removeVal(cat: data)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                .tint(.red)
                            }
                        }

                    }
                }.navigationTitle("Grocery List")
                    .toolbar {
                        Toggle(isOn: $isHierarychy) {
                            Text("Show as Hierarychy")
                    }
                }
            }
        }
    }

    func removeVal(cat:GroceryCategory){
        self.model.categories.removeAll { xcat in
            xcat == cat
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
        }
        .groceryListStyle(catName: categoryName)
    }
}

