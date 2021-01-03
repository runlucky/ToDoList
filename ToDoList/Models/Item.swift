//
//  Item.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//

import Foundation

internal class Item: ObservableObject, Codable {
    internal let id: UUID
    internal let create: Date

    @Published internal var checked: Bool {
        didSet {
            try? UserSettings.shared.upsert(self)
        }
    }
    @Published internal var title: String {
        didSet {
            try? UserSettings.shared.upsert(self)
        }
    }
    
    internal static var blank: Item {
        Item(false, "")
    }
    
    internal var description: String {
        "[\(checked ? "x" : " ")] \(title)"
    }

    internal init(_ checked: Bool, _ title: String) {
        self.id = UUID()
        self.create = Date()
        self.checked = checked
        self.title = title
    }
    
    private init(_ id: UUID, _ checked: Bool, _ title: String) {
        self.id = id
        self.create = Date()
        self.checked = checked
        self.title = title
    }

    internal func update(_ checked: Bool? = nil, _ title: String? = nil) -> Item {
        let checked = checked ?? self.checked
        let title = title ?? self.title
        return Item(id, checked, title)
    }

    internal enum CodingKeys: CodingKey {
        case id
        case create
        case checked
        case title
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id     , forKey: .id     )
        try container.encode(create , forKey: .create )
        try container.encode(checked, forKey: .checked)
        try container.encode(title  , forKey: .title  )
    }

    required internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id      = try container.decode(UUID.self  , forKey: .id     )
        create  = try container.decode(Date.self  , forKey: .create )
        checked = try container.decode(Bool.self  , forKey: .checked)
        title   = try container.decode(String.self, forKey: .title  )
    }

}
