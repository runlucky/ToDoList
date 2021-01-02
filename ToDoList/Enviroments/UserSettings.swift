//
//  UserDefaults.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//

import Foundation

internal struct UserSettings {
    internal static let shared = UserSettings()
    private let userDefaults = UserDefaults.standard
    private init(){}

    private func exists(_ key: String) -> Bool {
        userDefaults.object(forKey: key) != nil
    }
}

extension UserSettings: IItemStrage {
    private var key: String { "itemStrage" }

    internal func getAll() throws -> [Item] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        return try data.decode([Item].self)
    }

    internal func upsert(_ item: Item) throws {
        let items = try getAll() + [item]
        let data = try items.encode()
        userDefaults.set(data, forKey: key)
        // insertしかしてない
    }

    internal func delete(_ item: Item) throws {
        var items = try getAll()
        items.removeAll { $0.id == item.id }
        
        let data = try items.encode()
        userDefaults.set(data, forKey: key)
    }
}
