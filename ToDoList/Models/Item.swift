//
//  Item.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//

import Foundation

internal struct Item: Codable {
    internal let id: UUID
    internal let checked: Bool
    internal let title: String
    
    internal static var blank: Item {
        Item(false, "")
    }
    
    internal var description: String {
        "[\(checked ? "x" : " ")] \(title)"
    }

    internal init(_ checked: Bool, _ title: String) {
        self.id = UUID()
        self.checked = checked
        self.title = title
    }
    
    private init(_ id: UUID, _ checked: Bool, _ title: String) {
        self.id = id
        self.checked = checked
        self.title = title
    }

    internal func update(_ checked: Bool? = nil, _ title: String? = nil) -> Item {
        let checked = checked ?? self.checked
        let title = title ?? self.title
        return Item(id, checked, title)
    }
}
