//
//  ContentView.swift
//  GestureDrag01
//
//  Created by Shin yongjun on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
    @GestureState var locationState = CGPoint(x: 150, y: 30)
    
    var body: some View {
        ZStack {
            Color.white
            Rectangle()
                .fill(.brown)
                .position(locationState)
                .frame(width: 300, height: 30)
                .gesture(
                    DragGesture()
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
