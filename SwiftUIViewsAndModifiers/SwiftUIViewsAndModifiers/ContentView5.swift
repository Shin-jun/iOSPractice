//
//  ContentView5.swift
//  SwiftUIViewsAndModifiers
//
//  Created by Shin yongjun on 2022/10/15.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}
struct ContentView5: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.yellow)
            CapsuleText(text: "Second")
        }
    }
}

struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
