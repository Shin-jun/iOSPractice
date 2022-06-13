//
//  ColorPlus.swift
//  StateAndBinding01
//
//  Created by Shin yongjun on 2022/06/12.
//

import SwiftUI

struct ColorPlus: View {
    var body: some View {
        Text("Hello World")
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
            .background(.red)
            .ignoresSafeArea()
    }
}

struct ColorPlus_Previews: PreviewProvider {
    static var previews: some View {
        ColorPlus()
    }
}
