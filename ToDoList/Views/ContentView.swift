//
//  ContentView.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/29.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var itemList: ItemList
    internal init(_ itemList: ItemList) {
        self.itemList = itemList
    }

    internal var body: some View {
        NavigationView {
            List {
                ForEach(itemList.items, id: \.id) { item in
                    ItemView(item) {
                        try? itemList.upsert(item.update(!item.checked))
                    }
                }.onDelete { index in
                   try? itemList.delete(atOffsets: index)
                }
            }
            .navigationBarItems(trailing:
                Button("Add") {
                    try? itemList.upsert(Item.blank)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ItemList(UserSettings.shared))
    }
}


