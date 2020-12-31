//
//  Decoder.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//

import Foundation

fileprivate let decoder = JSONDecoder()
fileprivate let encoder = JSONEncoder()

extension Data {
    internal func decode<T>(_ type: T.Type) throws -> T where T: Decodable {
        try decoder.decode(type, from: self)
    }
}

extension Encodable {
    internal func encode() throws -> Data {
        try encoder.encode(self)
    }
}
