//
//  ButtonExtensions.swift
//  ToDoList
//
//  Created by H5267 on 2021/01/04.
//

import SwiftUI

extension Button where Label == Image {
//    internal init(image: String, _ text: String, _ action: @escaping () -> Void) {
//        Button(action: action) {
//            VStack {
//                Image(systemName: image)
//                Text(text)
//            }
//        }
//    }

    internal init(systenName: String, _ action: @escaping () -> Void) {
        self.init(action: action) {
            Image(systemName: systenName)
        }
    }

}
