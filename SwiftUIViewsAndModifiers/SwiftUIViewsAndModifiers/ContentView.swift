//
//  ContentView.swift
//  SwiftUIViewsAndModifiers
//
//  Created by Shin yongjun on 2022/06/28.
//

import SwiftUI

struct ContentView: View {
    @State private var userRedText = false
    
    var body: some View {
        Button("Hello, world!") {
            userRedText.toggle()
        }
        .foregroundColor(userRedText ? .red : .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
