//
//  IItemStrage.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//


internal protocol IItemStrage {
    func getAll() throws -> [Item]
    func upsert(item: Item) throws
    func delete(item: Item) throws
}


