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

    internal init(_ checked: Bool, _ title: String) {
        self.id = UUID()
        self.checked = checked
        self.title = title
    }

    internal var description: String {
        "\(checked): \(title)"
    }
}
