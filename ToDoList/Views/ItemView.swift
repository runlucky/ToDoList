//
//  ItemView.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//

import SwiftUI

internal struct ItemView: View {
    @ObservedObject private var viewModel: ItemViewModel
    private let onDelete: () -> Void

    internal init(_ viewModel: ItemViewModel, onDelete: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onDelete = onDelete
    }

    internal var body: some View {
        HStack {
            ZStack {
                Image(systemName: "square.fill")
                    .foregroundColor(.white)
                if viewModel.checked {
                    Image(systemName: "checkmark.square.fill")
                        .foregroundColor(.blue)
                }
                Image(systemName: "square")
                    .font(Font.headline.weight(.ultraLight))
                    .foregroundColor(.gray)
            }.onTapGesture {
                viewModel.checked.toggle()
            }
            TextField("", text: $viewModel.title)
            Button(action: { onDelete() }) {
                Image(systemName: "multiply")
                    .font(Font.headline.weight(.light))
                    .foregroundColor(.gray)
            }
        }
    }


}
