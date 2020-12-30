//
//  UserDefaults.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//

import Foundation

internal struct UserSettings {
    internal static let shared = UserSettings()
    private init(){}
}

extension UserSettings: IItemStrage {
    internal func getAll() throws -> [Item] {
        []
    }

    internal func upsert(item: Item) throws {

    }

    internal func delete(item: Item) throws {

    }


}
