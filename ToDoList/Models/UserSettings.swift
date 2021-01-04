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

    private var key: String { "itemStrage" }

    internal func getAll() throws -> [ItemViewModel] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        return try data.decode([ItemViewModel].self)
    }

    internal func upsert(_ item: ItemViewModel) throws {
        var items = try getAll()
        items.removeAll { $0.id == item.id }
        items += [item]
        
        let data = try items.encode()
        userDefaults.set(data, forKey: key)
    }

    internal func delete(_ item: ItemViewModel) throws {
        var items = try getAll()
        items.removeAll { $0.id == item.id }
        
        let data = try items.encode()
        userDefaults.set(data, forKey: key)
    }
}
