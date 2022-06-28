//
//  ContentView4.swift
//  SwiftUIViewsAndModifiers
//
//  Created by Shin yongjun on 2022/06/29.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)                    }
                }
            }
        }
    }
}
struct ContentView4: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Text("R\(row) C\(col)")
        }
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
