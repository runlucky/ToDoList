//
//  ItemList.swift
//  ToDoList
//
//  Created by 福田走 on 2021/01/01.
//

import SwiftUI

internal class ItemListViewModel: ObservableObject {
    @Published internal var items: [ItemViewModel] = []

    internal init() {
        items = load()
    }
    
    private func load() -> [ItemViewModel] {
        (try? UserSettings.shared.getAll()) ?? []
    }

    internal func upsert(_ item: ItemViewModel) throws {
        try UserSettings.shared.upsert(item)
        items = load()
    }

    internal func delete(_ item: ItemViewModel) throws {
        try UserSettings.shared.delete(item)
        items = load()
    }
}
