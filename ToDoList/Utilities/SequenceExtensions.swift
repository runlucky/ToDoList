//
//  SequenceExtensions.swift
//  ToDoList
//
//  Created by H5267 on 2021/01/04.
//

extension Collection {
    internal func sorted<T: Comparable>(_ predicate: (Element) -> T) -> [Element] {
        self.sorted { predicate($0) < predicate($1) }
    }
}
