//
//  ContentView.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/29.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject private var viewModel: ItemListViewModel
    internal init(_ viewModel: ItemListViewModel) {
        self.viewModel = viewModel
    }

    internal var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items.sorted { $0.create }, id: \.id) { item in
                    ItemView(item)
                }.onDelete { index in
                   try? viewModel.delete(atOffsets: index)
                }
            }
            .navigationBarItems(trailing:
                Button("Add") {
                    try? viewModel.upsert(ItemViewModel.blank)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(ItemListViewModel())
    }
}


