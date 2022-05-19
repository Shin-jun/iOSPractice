//
//  ContentView.swift
//  HabitTracker
//
//  Created by Shin yongjun on 2022/05/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
