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
        VStack {
            ForEach(itemList.items, id: \.id) { item in
                ItemView(item)
            }
            Button("set") {
                try? itemList.upsert(Item(true, "hoge\(Date())"))
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ItemList(UserSettings.shared))
    }
}


