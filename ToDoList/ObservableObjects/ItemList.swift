//
//  ItemList.swift
//  ToDoList
//
//  Created by 福田走 on 2021/01/01.
//

import SwiftUI

internal class ItemList: ObservableObject {
    @Published internal var items: [Item] = []
    private let itemStrage: IItemStrage

    internal init(_ itemStrage: IItemStrage) {
        self.itemStrage = itemStrage
        items = load()
    }
    
    private func load() -> [Item] {
        (try? self.itemStrage.getAll()) ?? []
    }

    internal func upsert(_ item: Item) throws {
        try itemStrage.upsert(item)
        items = load()
    }
    
    internal func delete(atOffsets offsets: IndexSet) throws {
        guard let index = offsets.first else { return }
        try itemStrage.delete(items[index])
        items.remove(atOffsets: offsets)
    }
}
