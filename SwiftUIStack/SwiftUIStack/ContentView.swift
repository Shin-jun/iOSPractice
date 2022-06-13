//
//  ContentView.swift
//  SwiftUIStack
//
//  Created by Shin yongjun on 2022/06/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            Text("Hello")
                .background(Color.yellow)
            Text("SwiftUI")
                .background(.green)
            
            HStack(alignment: .top, spacing: 50) {
                Text("Hello")
                    .background(Color.yellow)
                Text("SwiftUI")
                    .background(.green)
            }

        }
        .font(.system(size: 50))
        .foregroundColor(.pink)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
