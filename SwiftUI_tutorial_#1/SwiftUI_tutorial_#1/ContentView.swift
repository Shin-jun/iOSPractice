//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 신용준 on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .fontWeight(.bold)
            .font(.largeTitle)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
