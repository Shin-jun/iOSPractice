//
//  EnvironmentModifiers.swift
//  SwiftUIViewsAndModifiers
//
//  Created by Shin yongjun on 2022/06/29.
//

import SwiftUI

struct ContentView2: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
