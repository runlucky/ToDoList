//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/29.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(ItemList(UserSettings.shared))
        }
    }
}
