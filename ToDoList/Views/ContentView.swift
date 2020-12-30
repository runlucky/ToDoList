//
//  ContentView.swift
//  ToDoList
//
//  Created by H5267 on 2020/12/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ItemView(true)
            ItemView(true)
            ItemView(false)
            ItemView(false)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



