//
//  StateView.swift
//  SwiftUIWebSplit
//
//  Created by Shin yongjun on 2022/06/14.
//

import SwiftUI

struct StateView: View {
    @State private var name = ""
    var body: some View {
        Form {
            TextField("insert your name", text: $name)
            Text("Hello, \(name)!")
        }
        
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
