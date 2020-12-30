//
//  ItemView.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/30.
//

import SwiftUI

internal struct ItemView: View {
    private var checked: Bool

    internal init(_ checked: Bool) {
        self.checked = checked
    }

    internal var body: some View {
        HStack {
            ZStack {
                Image(systemName: "square.fill")
                    .foregroundColor(.white)
                if checked {
                    Image(systemName: "checkmark.square.fill")
                        .foregroundColor(.blue)
                }
                Image(systemName: "square")
                    .font(Font.headline.weight(.ultraLight))
                    .foregroundColor(.gray)
            }
            Text("hogehoge")
        }
    }


}
