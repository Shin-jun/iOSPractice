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
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Helicopter()
                    .position(self.heliPostion)
                    .onReceive(self.timer) {_ in
                        self.gravity()
                        
                    }
                
                Obstacle()
            }
            
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.black)
            
        .gesture(
            TapGesture()
                .onEnded {
                    withAnimation {
                        self.heliPostion.y -= 50
                    }
        })
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
    func gravity() {
        withAnimation { // 부드럽게
            self.heliPostion.y += 20
        }
    }
    
    func obstMove() {
        self.obstPosition.x -= 50
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
