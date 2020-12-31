//
//  ContentView.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/29.
//

import SwiftUI

struct ContentView: View {
    private let ItemList: itemList

    internal init(_ itemList: ItemList) {
        self.itemList = itemList
    }

    internal var body: some View {
        VStack {
            ItemView(true)
            ItemView(true)
            ItemView(false)
            ItemView(false)
            Button("set") {
                try? itemStrage.upsert(Item(true, "hoge\(Date())"))
            }
            Button("print") {
                guard let items = try? itemStrage.getAll() else { return }
                items.forEach { item in
                    print(item.description)

                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(UserSettings.shared)
    }
}





internal class ItemList: ObservableObject {
    @Published internal var items: [Item] = []
    private let itemStrage: IItemStrage

    internal init(_ itemStrage: IItemStrage) {
        self.itemStrage = itemStrage
        items = (try? self.itemStrage.getAll()) ?? []
    }

}
