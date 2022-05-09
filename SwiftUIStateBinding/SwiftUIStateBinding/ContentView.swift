//
//  ContentView.swift
//  SwiftUIStateBinding
//
//  Created by Shin yongjun on 2022/05/05.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @State var textHolder = "Hello GOGO"
    var body: some View {
        
        Text("\(textHolder)")
        StateBase(textHolder: self.$textHolder)
        Button("Dog says") {self.textHolder = "Woof"}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
