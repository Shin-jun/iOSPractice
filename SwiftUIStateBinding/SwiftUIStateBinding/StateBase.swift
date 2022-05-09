//
//  State.swift
//  SwiftUIStateBinding
//
//  Created by Shin yongjun on 2022/05/05.
//

import SwiftUI

struct StateBase: View {
    @Binding var textHolder: String
    var body: some View {
        Button("Cat says") {self.textHolder = "Meow"}
    }
}
