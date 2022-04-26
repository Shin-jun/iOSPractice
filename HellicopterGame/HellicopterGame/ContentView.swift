//
//  ContentView.swift
//  HellicopterGame
//
//  Created by Shin yongjun on 2022/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var heliPostion = CGPoint(x:100, y:100)
    @State private var obstPosition = CGPoint(x:1000, y:300)
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Helicopter()
                    .position(self.heliPostion)
                
                Obstacle()
            }
            
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.black)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
