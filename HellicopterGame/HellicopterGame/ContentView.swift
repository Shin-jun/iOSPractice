//
//  ContentView.swift
//  HellicopterGame
//
//  Created by Shin yongjun on 2022/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var heliPosition = CGPoint(x:100, y:100)
    @State private var obstPosition = CGPoint(x:1000, y:300)
    @State private var isPaused = false
    @State private var score = 0
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Helicopter()
                    .position(self.heliPosition)
                    .onReceive(self.timer) {_ in
                        self.gravity()
                        
                    }
                
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer){_ in
                        self.obstMove()
                    }
                
                Text("\(self.score)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 100, y: geo.size.height / 10)
                
                self.isPaused ? Button ("Restart") { self.resume() } : nil
                
                
            }
            
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.black)
            
            .gesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            self.heliPosition.y -= 100
                        }
                    })
            .onReceive(self.timer) { _ in
                self.collisionDetection()
                self.score += 1
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
    func gravity() {
        withAnimation { // 부드럽게
            self.heliPosition.y += 20
        }
    }
    
    func obstMove() {
        if self.obstPosition.x > 0 {
            withAnimation {
                self.obstPosition.x -= 20
            }
        } else {
            self.obstPosition.x = 1000
            self.obstPosition.y = CGFloat.random(in: 0...500)
        }
    }
    
    func pause() {
        self.timer.upstream.connect().cancel()
    }
    
    func resume() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
        self.obstPosition.x = 1000 // 장애물을 원래 자리로
        self.heliPosition = CGPoint(x: 100, y: 100)
        self.score = 0
    }
    
    func collisionDetection() {
        
        if abs(heliPosition.x - obstPosition.x) < (25 + 10) && abs(heliPosition.y - obstPosition.y) < (25 + 100) {
            self.pause()
            self.isPaused = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
