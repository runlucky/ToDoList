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
                    ItemView(item) {
                        try? viewModel.delete(item)
                    }
                }
            }
            .navigationBarItems(trailing:
                Button("Add") {
                    try? viewModel.upsert(ItemViewModel.blank)
                }
            )
//            HStack {
//                Button(action: {}) {
//                    VStack {
//                        Image(systemName: "arrow.up.arrow.down")
//                        Text("sort")
//                    }
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(ItemListViewModel())
    }
}


