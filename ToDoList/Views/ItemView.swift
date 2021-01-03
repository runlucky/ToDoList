//
//  ItemView.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//

import SwiftUI

internal struct ItemView: View {
    @ObservedObject private var item: Item

    internal init(_ item: Item) {
        self.item = item
    }

    internal var body: some View {
        HStack {
            ZStack {
                Image(systemName: "square.fill")
                    .foregroundColor(.white)
                if item.checked {
                    Image(systemName: "checkmark.square.fill")
                        .foregroundColor(.blue)
                }
                Image(systemName: "square")
                    .font(Font.headline.weight(.ultraLight))
                    .foregroundColor(.gray)
            }.onTapGesture {
                item.checked.toggle()
            }
            TextField("", text: $item.title)
        }
    }


}
